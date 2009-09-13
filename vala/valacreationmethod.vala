/* valacreationmethod.vala
 *
 * Copyright (C) 2007-2009  Jürg Billeter
 * Copyright (C) 2007-2008  Raffaele Sandrini
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 * Author:
 *	Raffaele Sandrini <raffaele@sandrini.ch>
 * 	Jürg Billeter <j@bitron.ch>
 */

using GLib;

/**
 * Represents a type creation method.
 */
public class Vala.CreationMethod : Method {
	/**
	 * Specifies the name of the type this creation method belongs to.
	 */
	public string class_name { get; set; }

	/**
	 * Specifies the number of parameters this creation method sets.
	 */
	public int n_construction_params { get; set; }

	/**
	 * Specifies a custom C return type for that creation method.
	 * Only the idl parser and the interface writer should use this.
	 * FIXME: remove this as soon the compiler has a decent attribute
	 * handling.
	 */
	public string? custom_return_type_cname { get; set; }

	/**
	 * Specifies whether this constructor chains up to a base
	 * constructor or a different constructor of the same class.
	 */
	public bool chain_up { get; set; }

	/**
	 * Creates a new method.
	 *
	 * @param name             method name
	 * @param source_reference reference to source code
	 * @return                 newly created method
	 */
	public CreationMethod (string? class_name, string? name, SourceReference? source_reference = null, Comment? comment = null) {
		base (name, new VoidType (), source_reference, comment);
		this.class_name = class_name;

		carray_length_parameter_position = -3;
		cdelegate_target_parameter_position = -3;
	}

	public override void accept (CodeVisitor visitor) {
		visitor.visit_creation_method (this);
	}

	public override void accept_children (CodeVisitor visitor) {
		foreach (FormalParameter param in get_parameters()) {
			param.accept (visitor);
		}

		foreach (DataType error_type in get_error_types ()) {
			error_type.accept (visitor);
		}

		if (body != null) {
			body.accept (visitor);
		}
	}

	public override string get_default_cname () {
		var parent = parent_symbol as TypeSymbol;

		string infix = "new";
		if (parent is Struct) {
			infix = "init";
		}

		if (name == ".new") {
			return "%s%s".printf (parent.get_lower_case_cprefix (), infix);
		} else {
			return "%s%s_%s".printf (parent.get_lower_case_cprefix (), infix, name);
		}
	}

	public override string get_real_cname () {
		var parent = parent_symbol as Class;

		if (parent == null || parent.is_compact) {
			return get_cname ();
		}

		var ccode_attribute = get_attribute ("CCode");
		if (ccode_attribute != null && ccode_attribute.has_argument ("construct_function")) {
			return ccode_attribute.get_string ("construct_function");
		}

		string infix = "construct";

		if (name == ".new") {
			return "%s%s".printf (parent.get_lower_case_cprefix (), infix);
		} else {
			return "%s%s_%s".printf (parent.get_lower_case_cprefix (), infix, name);
		}
	}

	public override bool check (SemanticAnalyzer analyzer) {
		if (checked) {
			return !error;
		}

		checked = true;

		process_attributes ();

		if (class_name != null && class_name != parent_symbol.name) {
			// class_name is null for constructors generated by GIdlParser
			Report.error (source_reference, "missing return type in method `%s.%s´".printf (analyzer.current_symbol.get_full_name (), class_name));
			error = true;
			return false;
		}

		var old_source_file = analyzer.current_source_file;
		var old_symbol = analyzer.current_symbol;

		if (source_reference != null) {
			analyzer.current_source_file = source_reference.file;
		}
		analyzer.current_symbol = this;

		foreach (FormalParameter param in get_parameters()) {
			param.check (analyzer);
		}

		foreach (DataType error_type in get_error_types ()) {
			error_type.check (analyzer);
		}

		if (body != null) {
			body.check (analyzer);

			var cl = parent_symbol as Class;

			// count construction property assignments
			if (analyzer.context.profile == Profile.GOBJECT && cl != null
			    && cl.is_subtype_of (analyzer.object_type)) {
				int n_params = 0;
				foreach (Statement stmt in body.get_statements ()) {
					var expr_stmt = stmt as ExpressionStatement;
					if (expr_stmt != null) {
						Property prop = expr_stmt.assigned_property ();
						if (prop != null && prop.set_accessor.construction) {
							n_params++;
						}
					}
				}
				n_construction_params = n_params;
			}

			// ensure we chain up to base constructor
			if (!chain_up && cl != null && cl.base_class != null) {
				if (cl.base_class.default_construction_method != null
				    && !cl.base_class.default_construction_method.has_construct_function) {
					// chain up impossible
				} else if (analyzer.context.profile == Profile.GOBJECT
				           && cl.is_subtype_of (analyzer.object_type)
				           && (n_construction_params > 0 || cl.constructor != null)) {
					// no chain up when using GObject construct properties or constructor
				} else if (cl.base_class.default_construction_method == null
				    || cl.base_class.default_construction_method.access == SymbolAccessibility.PRIVATE) {
					Report.warning (source_reference, "unable to chain up to private base constructor");
				} else if (cl.base_class.default_construction_method.get_required_arguments () > 0) {
					Report.warning (source_reference, "unable to chain up to base constructor requiring arguments");
				} else {
					var old_insert_block = analyzer.insert_block;
					analyzer.current_symbol = body;
					analyzer.insert_block = body;

					var stmt = new ExpressionStatement (new MethodCall (new BaseAccess (source_reference), source_reference), source_reference);
					body.insert_statement (0, stmt);
					stmt.check (analyzer);

					analyzer.current_symbol = this;
					analyzer.insert_block = old_insert_block;
				}
			}
		}

		analyzer.current_source_file = old_source_file;
		analyzer.current_symbol = old_symbol;

		if (is_abstract || is_virtual || overrides) {
			Report.error (source_reference, "The creation method `%s' cannot be marked as override, virtual, or abstract".printf (get_full_name ()));
			return false;
		}

		// check that all errors that can be thrown in the method body are declared
		if (body != null) {
			foreach (DataType body_error_type in body.get_error_types ()) {
				bool can_propagate_error = false;
				foreach (DataType method_error_type in get_error_types ()) {
					if (body_error_type.compatible (method_error_type)) {
						can_propagate_error = true;
					}
				}
				if (!can_propagate_error && !((ErrorType) body_error_type).dynamic_error) {
					Report.warning (body_error_type.source_reference, "unhandled error `%s'".printf (body_error_type.to_string()));
				}
			}
		}

		return !error;
	}
}

/* graphene-gobject-1.0.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Graphene", gir_namespace = "Graphene", gir_version = "1.0", lower_case_cprefix = "graphene_")]
namespace Graphene {
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_box_t", type_id = "graphene_box_get_type ()")]
	[Version (since = "1.2")]
	public struct Box {
		public bool contains_box (Graphene.Box b);
		public bool contains_point (Graphene.Point3D point);
		public static unowned Graphene.Box? empty ();
		public bool equal (Graphene.Box b);
		public Graphene.Box expand (Graphene.Point3D point);
		public Graphene.Box expand_scalar (float scalar);
		public Graphene.Box expand_vec3 (Graphene.Vec3 vec);
		public Graphene.Sphere get_bounding_sphere ();
		public Graphene.Point3D get_center ();
		public float get_depth ();
		public float get_height ();
		public Graphene.Point3D get_max ();
		public Graphene.Point3D get_min ();
		public Graphene.Vec3 get_size ();
		public void get_vertices ([CCode (array_length = false)] ref Graphene.Vec3 vertices[8]);
		public float get_width ();
		public static unowned Graphene.Box? infinite ();
		public unowned Graphene.Box? init (Graphene.Point3D? min, Graphene.Point3D? max);
		public unowned Graphene.Box? init_from_box (Graphene.Box src);
		public unowned Graphene.Box? init_from_points ([CCode (array_length_cname = "n_points", array_length_pos = 0.5, array_length_type = "guint")] Graphene.Point3D[] points);
		public unowned Graphene.Box? init_from_vec3 (Graphene.Vec3? min, Graphene.Vec3? max);
		public unowned Graphene.Box? init_from_vectors ([CCode (array_length_cname = "n_vectors", array_length_pos = 0.5, array_length_type = "guint")] Graphene.Vec3[] vectors);
		public bool intersection (Graphene.Box b, out Graphene.Box res);
		public static unowned Graphene.Box? minus_one ();
		public static unowned Graphene.Box? one ();
		public static unowned Graphene.Box? one_minus_one ();
		public Graphene.Box union (Graphene.Box b);
		public static unowned Graphene.Box? zero ();
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_euler_t", type_id = "graphene_euler_get_type ()")]
	[Version (since = "1.2")]
	public struct Euler {
		public bool equal (Graphene.Euler b);
		[Version (since = "1.10")]
		public float get_alpha ();
		[Version (since = "1.10")]
		public float get_beta ();
		[Version (since = "1.10")]
		public float get_gamma ();
		public Graphene.EulerOrder get_order ();
		public float get_x ();
		public float get_y ();
		public float get_z ();
		public unowned Graphene.Euler? init (float x, float y, float z);
		public unowned Graphene.Euler? init_from_euler (Graphene.Euler? src);
		public unowned Graphene.Euler? init_from_matrix (Graphene.Matrix? m, Graphene.EulerOrder order);
		public unowned Graphene.Euler? init_from_quaternion (Graphene.Quaternion? q, Graphene.EulerOrder order);
		[Version (since = "1.10")]
		public unowned Graphene.Euler? init_from_radians (float x, float y, float z, Graphene.EulerOrder order);
		public unowned Graphene.Euler? init_from_vec3 (Graphene.Vec3? v, Graphene.EulerOrder order);
		public unowned Graphene.Euler? init_with_order (float x, float y, float z, Graphene.EulerOrder order);
		public Graphene.Euler reorder (Graphene.EulerOrder order);
		public Graphene.Matrix to_matrix ();
		[Version (since = "1.10")]
		public Graphene.Quaternion to_quaternion ();
		public Graphene.Vec3 to_vec3 ();
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_frustum_t", type_id = "graphene_frustum_get_type ()")]
	[Version (since = "1.2")]
	public struct Frustum {
		public bool contains_point (Graphene.Point3D point);
		[Version (since = "1.6")]
		public bool equal (Graphene.Frustum b);
		public void get_planes ([CCode (array_length = false)] ref Graphene.Plane planes[6]);
		public unowned Graphene.Frustum? init (Graphene.Plane p0, Graphene.Plane p1, Graphene.Plane p2, Graphene.Plane p3, Graphene.Plane p4, Graphene.Plane p5);
		public unowned Graphene.Frustum? init_from_frustum (Graphene.Frustum src);
		public unowned Graphene.Frustum? init_from_matrix (Graphene.Matrix matrix);
		public bool intersects_box (Graphene.Box box);
		public bool intersects_sphere (Graphene.Sphere sphere);
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_matrix_t", type_id = "graphene_matrix_get_type ()")]
	public struct Matrix {
		[Version (since = "1.0")]
		public float determinant ();
		[Version (since = "1.10")]
		public bool equal (Graphene.Matrix b);
		[Version (since = "1.10")]
		public bool equal_fast (Graphene.Matrix b);
		[Version (since = "1.0")]
		public Graphene.Vec4 get_row (uint index_);
		[Version (since = "1.0")]
		public float get_value (uint row, uint col);
		[Version (since = "1.0")]
		public float get_x_scale ();
		[Version (since = "1.10")]
		public float get_x_translation ();
		[Version (since = "1.0")]
		public float get_y_scale ();
		[Version (since = "1.10")]
		public float get_y_translation ();
		[Version (since = "1.0")]
		public float get_z_scale ();
		[Version (since = "1.10")]
		public float get_z_translation ();
		[Version (since = "1.0")]
		public unowned Graphene.Matrix? init_from_2d (double xx, double yx, double xy, double yy, double x_0, double y_0);
		[Version (since = "1.0")]
		public unowned Graphene.Matrix? init_from_float ([CCode (array_length = false)] float v[16]);
		[Version (since = "1.0")]
		public unowned Graphene.Matrix? init_from_matrix (Graphene.Matrix src);
		[Version (since = "1.0")]
		public unowned Graphene.Matrix? init_from_vec4 (Graphene.Vec4 v0, Graphene.Vec4 v1, Graphene.Vec4 v2, Graphene.Vec4 v3);
		[Version (since = "1.2")]
		public unowned Graphene.Matrix? init_frustum (float left, float right, float bottom, float top, float z_near, float z_far);
		[Version (since = "1.0")]
		public unowned Graphene.Matrix? init_identity ();
		[Version (since = "1.0")]
		public unowned Graphene.Matrix? init_look_at (Graphene.Vec3 eye, Graphene.Vec3 center, Graphene.Vec3 up);
		[Version (since = "1.0")]
		public unowned Graphene.Matrix? init_ortho (float left, float right, float top, float bottom, float z_near, float z_far);
		[Version (since = "1.0")]
		public unowned Graphene.Matrix? init_perspective (float fovy, float aspect, float z_near, float z_far);
		[Version (since = "1.0")]
		public unowned Graphene.Matrix? init_rotate (float angle, Graphene.Vec3 axis);
		[Version (since = "1.0")]
		public unowned Graphene.Matrix? init_scale (float x, float y, float z);
		[Version (since = "1.0")]
		public unowned Graphene.Matrix? init_skew (float x_skew, float y_skew);
		[Version (since = "1.0")]
		public unowned Graphene.Matrix? init_translate (Graphene.Point3D p);
		[Version (since = "1.0")]
		public Graphene.Matrix interpolate (Graphene.Matrix b, double factor);
		[Version (since = "1.0")]
		public bool inverse (out Graphene.Matrix res);
		[Version (since = "1.0")]
		public bool is_2d ();
		[Version (since = "1.0")]
		public bool is_backface_visible ();
		[Version (since = "1.0")]
		public bool is_identity ();
		[Version (since = "1.0")]
		public bool is_singular ();
		[Version (since = "1.0")]
		public Graphene.Matrix multiply (Graphene.Matrix b);
		[Version (since = "1.10")]
		public bool near (Graphene.Matrix b, float epsilon);
		[Version (since = "1.0")]
		public Graphene.Matrix normalize ();
		[Version (since = "1.0")]
		public Graphene.Matrix perspective (float depth);
		[Version (since = "1.0")]
		public void print ();
		[Version (since = "1.0")]
		public Graphene.Point project_point (Graphene.Point p);
		[Version (since = "1.2")]
		public Graphene.Quad project_rect (Graphene.Rect r);
		[Version (since = "1.0")]
		public Graphene.Rect project_rect_bounds (Graphene.Rect r);
		[Version (since = "1.0")]
		public void rotate (float angle, Graphene.Vec3 axis);
		[Version (since = "1.2")]
		public void rotate_euler (Graphene.Euler e);
		[Version (since = "1.2")]
		public void rotate_quaternion (Graphene.Quaternion q);
		[Version (since = "1.0")]
		public void rotate_x (float angle);
		[Version (since = "1.0")]
		public void rotate_y (float angle);
		[Version (since = "1.0")]
		public void rotate_z (float angle);
		[Version (since = "1.0")]
		public void scale (float factor_x, float factor_y, float factor_z);
		[Version (since = "1.0")]
		public void skew_xy (float factor);
		[Version (since = "1.0")]
		public void skew_xz (float factor);
		[Version (since = "1.0")]
		public void skew_yz (float factor);
		[Version (since = "1.0")]
		public bool to_2d (out double xx, out double yx, out double xy, out double yy, out double x_0, out double y_0);
		[Version (since = "1.0")]
		public void to_float ([CCode (array_length = false)] ref float v[16]);
		[Version (since = "1.0")]
		public Graphene.Rect transform_bounds (Graphene.Rect r);
		[Version (since = "1.2")]
		public Graphene.Box transform_box (Graphene.Box b);
		[Version (since = "1.0")]
		public Graphene.Point transform_point (Graphene.Point p);
		[Version (since = "1.2")]
		public Graphene.Point3D transform_point3d (Graphene.Point3D p);
		[Version (since = "1.4")]
		public Graphene.Ray transform_ray (Graphene.Ray r);
		[Version (since = "1.0")]
		public Graphene.Quad transform_rect (Graphene.Rect r);
		[Version (since = "1.2")]
		public Graphene.Sphere transform_sphere (Graphene.Sphere s);
		[Version (since = "1.0")]
		public Graphene.Vec3 transform_vec3 (Graphene.Vec3 v);
		[Version (since = "1.0")]
		public Graphene.Vec4 transform_vec4 (Graphene.Vec4 v);
		[Version (since = "1.0")]
		public void translate (Graphene.Point3D pos);
		[Version (since = "1.0")]
		public Graphene.Matrix transpose ();
		[Version (since = "1.2")]
		public Graphene.Point3D unproject_point3d (Graphene.Matrix modelview, Graphene.Point3D point);
		[Version (since = "1.0")]
		public Graphene.Rect untransform_bounds (Graphene.Rect r, Graphene.Rect bounds);
		[Version (since = "1.0")]
		public bool untransform_point (Graphene.Point p, Graphene.Rect bounds, out Graphene.Point res);
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_plane_t", type_id = "graphene_plane_get_type ()")]
	[Version (since = "1.2")]
	public struct Plane {
		public float distance (Graphene.Point3D point);
		public bool equal (Graphene.Plane b);
		public float get_constant ();
		public Graphene.Vec3 get_normal ();
		public unowned Graphene.Plane? init (Graphene.Vec3? normal, float constant);
		public unowned Graphene.Plane? init_from_plane (Graphene.Plane src);
		public unowned Graphene.Plane? init_from_point (Graphene.Vec3 normal, Graphene.Point3D point);
		public unowned Graphene.Plane? init_from_points (Graphene.Point3D a, Graphene.Point3D b, Graphene.Point3D c);
		public unowned Graphene.Plane? init_from_vec4 (Graphene.Vec4 src);
		public Graphene.Plane negate ();
		public Graphene.Plane normalize ();
		[Version (since = "1.10")]
		public Graphene.Plane transform (Graphene.Matrix matrix, Graphene.Matrix? normal_matrix);
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_point_t", type_id = "graphene_point_get_type ()")]
	[Version (since = "1.0")]
	public struct Point {
		public float x;
		public float y;
		public float distance (Graphene.Point b, out float d_x, out float d_y);
		public bool equal (Graphene.Point b);
		public unowned Graphene.Point? init (float x, float y);
		public unowned Graphene.Point? init_from_point (Graphene.Point src);
		[Version (since = "1.4")]
		public unowned Graphene.Point? init_from_vec2 (Graphene.Vec2 src);
		public Graphene.Point interpolate (Graphene.Point b, double factor);
		public bool near (Graphene.Point b, float epsilon);
		[Version (since = "1.4")]
		public Graphene.Vec2 to_vec2 ();
		public static unowned Graphene.Point? zero ();
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_point3d_t", lower_case_csuffix = "point3d", type_id = "graphene_point3d_get_type ()")]
	[Version (since = "1.0")]
	public struct Point3D {
		public float x;
		public float y;
		public float z;
		public Graphene.Point3D cross (Graphene.Point3D b);
		[Version (since = "1.4")]
		public float distance (Graphene.Point3D b, out Graphene.Vec3 delta);
		public float dot (Graphene.Point3D b);
		public bool equal (Graphene.Point3D b);
		public unowned Graphene.Point3D? init (float x, float y, float z);
		public unowned Graphene.Point3D? init_from_point (Graphene.Point3D src);
		public unowned Graphene.Point3D? init_from_vec3 (Graphene.Vec3 v);
		public Graphene.Point3D interpolate (Graphene.Point3D b, double factor);
		public float length ();
		public bool near (Graphene.Point3D b, float epsilon);
		public Graphene.Point3D normalize ();
		[Version (since = "1.4")]
		public Graphene.Point3D normalize_viewport (Graphene.Rect viewport, float z_near, float z_far);
		public Graphene.Point3D scale (float factor);
		public Graphene.Vec3 to_vec3 ();
		public static unowned Graphene.Point3D? zero ();
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_quad_t", type_id = "graphene_quad_get_type ()")]
	[Version (since = "1.0")]
	public struct Quad {
		public Graphene.Rect bounds ();
		public bool contains (Graphene.Point p);
		public unowned Graphene.Point? get_point (uint index_);
		public unowned Graphene.Quad? init (Graphene.Point p1, Graphene.Point p2, Graphene.Point p3, Graphene.Point p4);
		[Version (since = "1.2")]
		public unowned Graphene.Quad? init_from_points ([CCode (array_length = false)] Graphene.Point points[4]);
		public unowned Graphene.Quad? init_from_rect (Graphene.Rect r);
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_quaternion_t", type_id = "graphene_quaternion_get_type ()")]
	[Version (since = "1.0")]
	public struct Quaternion {
		[Version (since = "1.10")]
		public Graphene.Quaternion add (Graphene.Quaternion b);
		public float dot (Graphene.Quaternion b);
		public bool equal (Graphene.Quaternion b);
		public unowned Graphene.Quaternion? init (float x, float y, float z, float w);
		public unowned Graphene.Quaternion? init_from_angle_vec3 (float angle, Graphene.Vec3 axis);
		public unowned Graphene.Quaternion? init_from_angles (float deg_x, float deg_y, float deg_z);
		[Version (since = "1.2")]
		public unowned Graphene.Quaternion? init_from_euler (Graphene.Euler e);
		public unowned Graphene.Quaternion? init_from_matrix (Graphene.Matrix m);
		public unowned Graphene.Quaternion? init_from_quaternion (Graphene.Quaternion src);
		public unowned Graphene.Quaternion? init_from_radians (float rad_x, float rad_y, float rad_z);
		public unowned Graphene.Quaternion? init_from_vec4 (Graphene.Vec4 src);
		public unowned Graphene.Quaternion? init_identity ();
		public Graphene.Quaternion invert ();
		[Version (since = "1.10")]
		public Graphene.Quaternion multiply (Graphene.Quaternion b);
		public Graphene.Quaternion normalize ();
		[Version (since = "1.10")]
		public Graphene.Quaternion scale (float factor);
		public Graphene.Quaternion slerp (Graphene.Quaternion b, float factor);
		public void to_angle_vec3 (out float angle, out Graphene.Vec3 axis);
		[Version (since = "1.2")]
		public void to_angles (out float deg_x, out float deg_y, out float deg_z);
		public Graphene.Matrix to_matrix ();
		[Version (since = "1.2")]
		public void to_radians (out float rad_x, out float rad_y, out float rad_z);
		public Graphene.Vec4 to_vec4 ();
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_ray_t", type_id = "graphene_ray_get_type ()")]
	[Version (since = "1.4")]
	public struct Ray {
		public bool equal (Graphene.Ray b);
		public Graphene.Point3D get_closest_point_to_point (Graphene.Point3D p);
		public Graphene.Vec3 get_direction ();
		public float get_distance_to_plane (Graphene.Plane p);
		public float get_distance_to_point (Graphene.Point3D p);
		public Graphene.Point3D get_origin ();
		public Graphene.Point3D get_position_at (float t);
		public unowned Graphene.Ray? init (Graphene.Point3D? origin, Graphene.Vec3? direction);
		public unowned Graphene.Ray? init_from_ray (Graphene.Ray src);
		public unowned Graphene.Ray? init_from_vec3 (Graphene.Vec3? origin, Graphene.Vec3? direction);
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_rect_t", type_id = "graphene_rect_get_type ()")]
	[Version (since = "1.0")]
	public struct Rect {
		public Graphene.Point origin;
		public Graphene.Size size;
		public static Graphene.Rect? alloc ();
		public bool contains_point (Graphene.Point p);
		public bool contains_rect (Graphene.Rect b);
		public bool equal (Graphene.Rect b);
		[Version (since = "1.4")]
		public Graphene.Rect expand (Graphene.Point p);
		[Version (since = "1.10")]
		public float get_area ();
		public Graphene.Point get_bottom_left ();
		public Graphene.Point get_bottom_right ();
		public Graphene.Point get_center ();
		public float get_height ();
		public Graphene.Point get_top_left ();
		public Graphene.Point get_top_right ();
		[Version (since = "1.4")]
		public void get_vertices ([CCode (array_length = false)] ref Graphene.Vec2 vertices[4]);
		public float get_width ();
		public float get_x ();
		public float get_y ();
		public unowned Graphene.Rect? init (float x, float y, float width, float height);
		public unowned Graphene.Rect? init_from_rect (Graphene.Rect src);
		public unowned Graphene.Rect? inset (float d_x, float d_y);
		[Version (since = "1.4")]
		public Graphene.Rect inset_r (float d_x, float d_y);
		public Graphene.Rect interpolate (Graphene.Rect b, double factor);
		public bool intersection (Graphene.Rect b, out Graphene.Rect res);
		public unowned Graphene.Rect? normalize ();
		[Version (since = "1.4")]
		public Graphene.Rect normalize_r ();
		public unowned Graphene.Rect? offset (float d_x, float d_y);
		[Version (since = "1.4")]
		public Graphene.Rect offset_r (float d_x, float d_y);
		[Version (deprecated = true, deprecated_since = "1.10", since = "1.4")]
		public Graphene.Rect round ();
		[Version (since = "1.10")]
		public Graphene.Rect round_extents ();
		[Version (deprecated = true, deprecated_since = "1.4", since = "1.0")]
		public unowned Graphene.Rect? round_to_pixel ();
		[Version (since = "1.10")]
		public Graphene.Rect scale (float s_h, float s_v);
		public Graphene.Rect union (Graphene.Rect b);
		[Version (since = "1.4")]
		public static unowned Graphene.Rect? zero ();
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_simd4f_t", has_type_id = false)]
	public struct Simd4F {
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_simd4x4f_t", has_type_id = false)]
	public struct Simd4X4F {
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_size_t", type_id = "graphene_size_get_type ()")]
	[Version (since = "1.0")]
	public struct Size {
		public float width;
		public float height;
		public bool equal (Graphene.Size b);
		public unowned Graphene.Size? init (float width, float height);
		public unowned Graphene.Size? init_from_size (Graphene.Size src);
		public Graphene.Size interpolate (Graphene.Size b, double factor);
		public Graphene.Size scale (float factor);
		public static unowned Graphene.Size? zero ();
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_sphere_t", type_id = "graphene_sphere_get_type ()")]
	[Version (since = "1.2")]
	public struct Sphere {
		public bool contains_point (Graphene.Point3D point);
		public float distance (Graphene.Point3D point);
		public bool equal (Graphene.Sphere b);
		public Graphene.Box get_bounding_box ();
		public Graphene.Point3D get_center ();
		public float get_radius ();
		public unowned Graphene.Sphere? init (Graphene.Point3D? center, float radius);
		public unowned Graphene.Sphere? init_from_points ([CCode (array_length_cname = "n_points", array_length_pos = 0.5, array_length_type = "guint")] Graphene.Point3D[] points, Graphene.Point3D? center);
		public unowned Graphene.Sphere? init_from_vectors ([CCode (array_length_cname = "n_vectors", array_length_pos = 0.5, array_length_type = "guint")] Graphene.Vec3[] vectors, Graphene.Point3D? center);
		public bool is_empty ();
		public Graphene.Sphere translate (Graphene.Point3D point);
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_triangle_t", type_id = "graphene_triangle_get_type ()")]
	[Version (since = "1.2")]
	public struct Triangle {
		public bool contains_point (Graphene.Point3D p);
		public bool equal (Graphene.Triangle b);
		public float get_area ();
		public bool get_barycoords (Graphene.Point3D? p, out Graphene.Vec2 res);
		public Graphene.Box get_bounding_box ();
		public Graphene.Point3D get_midpoint ();
		public Graphene.Vec3 get_normal ();
		public Graphene.Plane get_plane ();
		public void get_points (out Graphene.Point3D a, out Graphene.Point3D b, out Graphene.Point3D c);
		public void get_vertices (out Graphene.Vec3 a, out Graphene.Vec3 b, out Graphene.Vec3 c);
		public unowned Graphene.Triangle? init_from_point3d (Graphene.Point3D? a, Graphene.Point3D? b, Graphene.Point3D? c);
		public unowned Graphene.Triangle? init_from_vec3 (Graphene.Vec3? a, Graphene.Vec3? b, Graphene.Vec3? c);
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_vec2_t", type_id = "graphene_vec2_get_type ()")]
	public struct Vec2 {
		[Version (since = "1.0")]
		public Graphene.Vec2 add (Graphene.Vec2 b);
		[Version (since = "1.0")]
		public Graphene.Vec2 divide (Graphene.Vec2 b);
		[Version (since = "1.0")]
		public float dot (Graphene.Vec2 b);
		[Version (since = "1.2")]
		public bool equal (Graphene.Vec2 v2);
		[Version (since = "1.0")]
		public float get_x ();
		[Version (since = "1.0")]
		public float get_y ();
		[Version (since = "1.0")]
		public unowned Graphene.Vec2? init (float x, float y);
		[Version (since = "1.0")]
		public unowned Graphene.Vec2? init_from_float ([CCode (array_length = false)] float src[2]);
		[Version (since = "1.0")]
		public unowned Graphene.Vec2? init_from_vec2 (Graphene.Vec2 src);
		[Version (since = "1.10")]
		public Graphene.Vec2 interpolate (Graphene.Vec2 v2, double factor);
		[Version (since = "1.0")]
		public float length ();
		[Version (since = "1.0")]
		public Graphene.Vec2 max (Graphene.Vec2 b);
		[Version (since = "1.0")]
		public Graphene.Vec2 min (Graphene.Vec2 b);
		[Version (since = "1.0")]
		public Graphene.Vec2 multiply (Graphene.Vec2 b);
		[Version (since = "1.2")]
		public bool near (Graphene.Vec2 v2, float epsilon);
		[Version (since = "1.2")]
		public Graphene.Vec2 negate ();
		[Version (since = "1.0")]
		public Graphene.Vec2 normalize ();
		[Version (since = "1.0")]
		public static unowned Graphene.Vec2? one ();
		[Version (since = "1.2")]
		public Graphene.Vec2 scale (float factor);
		[Version (since = "1.0")]
		public Graphene.Vec2 subtract (Graphene.Vec2 b);
		[Version (since = "1.0")]
		public void to_float ([CCode (array_length = false)] ref float dest[2]);
		[Version (since = "1.0")]
		public static unowned Graphene.Vec2? x_axis ();
		[Version (since = "1.0")]
		public static unowned Graphene.Vec2? y_axis ();
		[Version (since = "1.0")]
		public static unowned Graphene.Vec2? zero ();
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_vec3_t", type_id = "graphene_vec3_get_type ()")]
	public struct Vec3 {
		[Version (since = "1.0")]
		public Graphene.Vec3 add (Graphene.Vec3 b);
		[Version (since = "1.0")]
		public Graphene.Vec3 cross (Graphene.Vec3 b);
		[Version (since = "1.0")]
		public Graphene.Vec3 divide (Graphene.Vec3 b);
		[Version (since = "1.0")]
		public float dot (Graphene.Vec3 b);
		[Version (since = "1.2")]
		public bool equal (Graphene.Vec3 v2);
		[Version (since = "1.0")]
		public float get_x ();
		[Version (since = "1.0")]
		public Graphene.Vec2 get_xy ();
		[Version (since = "1.0")]
		public Graphene.Vec3 get_xy0 ();
		[Version (since = "1.0")]
		public Graphene.Vec4 get_xyz0 ();
		[Version (since = "1.0")]
		public Graphene.Vec4 get_xyz1 ();
		[Version (since = "1.0")]
		public Graphene.Vec4 get_xyzw (float w);
		[Version (since = "1.0")]
		public float get_y ();
		[Version (since = "1.0")]
		public float get_z ();
		[Version (since = "1.0")]
		public unowned Graphene.Vec3? init (float x, float y, float z);
		[Version (since = "1.0")]
		public unowned Graphene.Vec3? init_from_float ([CCode (array_length = false)] float src[3]);
		[Version (since = "1.0")]
		public unowned Graphene.Vec3? init_from_vec3 (Graphene.Vec3 src);
		[Version (since = "1.10")]
		public Graphene.Vec3 interpolate (Graphene.Vec3 v2, double factor);
		[Version (since = "1.0")]
		public float length ();
		[Version (since = "1.0")]
		public Graphene.Vec3 max (Graphene.Vec3 b);
		[Version (since = "1.0")]
		public Graphene.Vec3 min (Graphene.Vec3 b);
		[Version (since = "1.0")]
		public Graphene.Vec3 multiply (Graphene.Vec3 b);
		[Version (since = "1.2")]
		public bool near (Graphene.Vec3 v2, float epsilon);
		[Version (since = "1.2")]
		public Graphene.Vec3 negate ();
		[Version (since = "1.0")]
		public Graphene.Vec3 normalize ();
		[Version (since = "1.0")]
		public static unowned Graphene.Vec3? one ();
		[Version (since = "1.2")]
		public Graphene.Vec3 scale (float factor);
		[Version (since = "1.0")]
		public Graphene.Vec3 subtract (Graphene.Vec3 b);
		[Version (since = "1.0")]
		public void to_float ([CCode (array_length = false)] ref float dest[3]);
		[Version (since = "1.0")]
		public static unowned Graphene.Vec3? x_axis ();
		[Version (since = "1.0")]
		public static unowned Graphene.Vec3? y_axis ();
		[Version (since = "1.0")]
		public static unowned Graphene.Vec3? z_axis ();
		[Version (since = "1.0")]
		public static unowned Graphene.Vec3? zero ();
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_vec4_t", type_id = "graphene_vec4_get_type ()")]
	public struct Vec4 {
		[Version (since = "1.0")]
		public Graphene.Vec4 add (Graphene.Vec4 b);
		[Version (since = "1.0")]
		public Graphene.Vec4 divide (Graphene.Vec4 b);
		[Version (since = "1.0")]
		public float dot (Graphene.Vec4 b);
		[Version (since = "1.2")]
		public bool equal (Graphene.Vec4 v2);
		[Version (since = "1.0")]
		public float get_w ();
		[Version (since = "1.0")]
		public float get_x ();
		[Version (since = "1.0")]
		public Graphene.Vec2 get_xy ();
		[Version (since = "1.0")]
		public Graphene.Vec3 get_xyz ();
		[Version (since = "1.0")]
		public float get_y ();
		[Version (since = "1.0")]
		public float get_z ();
		[Version (since = "1.0")]
		public unowned Graphene.Vec4? init (float x, float y, float z, float w);
		[Version (since = "1.0")]
		public unowned Graphene.Vec4? init_from_float ([CCode (array_length = false)] float src[4]);
		[Version (since = "1.0")]
		public unowned Graphene.Vec4? init_from_vec2 (Graphene.Vec2 src, float z, float w);
		[Version (since = "1.0")]
		public unowned Graphene.Vec4? init_from_vec3 (Graphene.Vec3 src, float w);
		[Version (since = "1.0")]
		public unowned Graphene.Vec4? init_from_vec4 (Graphene.Vec4 src);
		[Version (since = "1.10")]
		public Graphene.Vec4 interpolate (Graphene.Vec4 v2, double factor);
		[Version (since = "1.0")]
		public float length ();
		[Version (since = "1.0")]
		public Graphene.Vec4 max (Graphene.Vec4 b);
		[Version (since = "1.0")]
		public Graphene.Vec4 min (Graphene.Vec4 b);
		[Version (since = "1.0")]
		public Graphene.Vec4 multiply (Graphene.Vec4 b);
		[Version (since = "1.2")]
		public bool near (Graphene.Vec4 v2, float epsilon);
		[Version (since = "1.2")]
		public Graphene.Vec4 negate ();
		[Version (since = "1.0")]
		public Graphene.Vec4 normalize ();
		[Version (since = "1.0")]
		public static unowned Graphene.Vec4? one ();
		[Version (since = "1.2")]
		public Graphene.Vec4 scale (float factor);
		[Version (since = "1.0")]
		public Graphene.Vec4 subtract (Graphene.Vec4 b);
		[Version (since = "1.0")]
		public void to_float ([CCode (array_length = false)] ref float dest[4]);
		[Version (since = "1.0")]
		public static unowned Graphene.Vec4? w_axis ();
		[Version (since = "1.0")]
		public static unowned Graphene.Vec4? x_axis ();
		[Version (since = "1.0")]
		public static unowned Graphene.Vec4? y_axis ();
		[Version (since = "1.0")]
		public static unowned Graphene.Vec4? z_axis ();
		[Version (since = "1.0")]
		public static unowned Graphene.Vec4? zero ();
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "graphene_euler_order_t", cprefix = "GRAPHENE_EULER_ORDER_", has_type_id = false)]
	[Version (since = "1.2")]
	public enum EulerOrder {
		DEFAULT,
		XYZ,
		YZX,
		ZXY,
		XZY,
		YXZ,
		ZYX,
		SXYZ,
		SXYX,
		SXZY,
		SXZX,
		SYZX,
		SYZY,
		SYXZ,
		SYXY,
		SZXY,
		SZXZ,
		SZYX,
		SZYZ,
		RZYX,
		RXYX,
		RYZX,
		RXZX,
		RXZY,
		RYZY,
		RZXY,
		RYXY,
		RYXZ,
		RZXZ,
		RXYZ,
		RZYZ
	}
	[CCode (cheader_filename = "graphene-gobject.h", cname = "GRAPHENE_HAS_GCC")]
	public const int HAS_GCC;
	[CCode (cheader_filename = "graphene-gobject.h", cname = "GRAPHENE_HAS_SCALAR")]
	public const int HAS_SCALAR;
	[CCode (cheader_filename = "graphene-gobject.h", cname = "GRAPHENE_HAS_SSE")]
	public const int HAS_SSE;
	[CCode (cheader_filename = "graphene-gobject.h", cname = "GRAPHENE_PI")]
	public const double PI;
	[CCode (cheader_filename = "graphene-gobject.h", cname = "GRAPHENE_PI_2")]
	public const double PI_2;
	[CCode (cheader_filename = "graphene-gobject.h", cname = "GRAPHENE_SIMD_S")]
	public const string SIMD_S;
	[CCode (cheader_filename = "graphene-gobject.h", cname = "GRAPHENE_VEC2_LEN")]
	[Version (since = "1.0")]
	public const int VEC2_LEN;
	[CCode (cheader_filename = "graphene-gobject.h", cname = "GRAPHENE_VEC3_LEN")]
	[Version (since = "1.0")]
	public const int VEC3_LEN;
	[CCode (cheader_filename = "graphene-gobject.h", cname = "GRAPHENE_VEC4_LEN")]
	[Version (since = "1.0")]
	public const int VEC4_LEN;
	[CCode (cheader_filename = "graphene-gobject.h", cname = "false")]
	public const int @false;
	[CCode (cheader_filename = "graphene-gobject.h", cname = "true")]
	public const int @true;
}

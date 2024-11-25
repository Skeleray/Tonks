extends Node3D

var global_mouse_position := Vector3.ZERO
@export var meshTest : MeshInstance3D

func _process(delta: float) -> void:
	var target_plane_mouse := Plane(Vector3(0,1,0),position.y)
	var ray_length := 10000.0
	var mouse_position = get_viewport().get_mouse_position()
	var camera := get_viewport().get_camera_3d()
	var from = camera.project_ray_origin(mouse_position)
	var to := camera.project_ray_normal(mouse_position) * ray_length
	var intersection_point = target_plane_mouse.intersects_ray(from,to)
	if intersection_point is Vector3:
		global_mouse_position = intersection_point as Vector3
		meshTest.global_position = global_mouse_position
	

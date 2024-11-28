extends Node3D
class_name  PlayerMouse

var current_mouse_position : Vector3
@export var tank_head:TankHead
@export var mesh :MeshInstance3D 

func _process(delta: float) -> void:
	var viewPort := get_viewport()
	var mouse_position := viewPort.get_mouse_position()
	var camera :=  viewPort.get_camera_3d()
	
	var origin := camera.project_ray_origin(mouse_position)
	var direction := camera.project_ray_normal(mouse_position)
	
	var ray_lengt := camera.far
	var end := origin + direction * ray_lengt;
	
	var space_state := get_world_3d().direct_space_state
	var query := PhysicsRayQueryParameters3D.create(origin,end)
	var result := space_state.intersect_ray(query)
	var mouse_position_world: Vector3
	if not result.is_empty() :
			mouse_position_world = result["position"]
			current_mouse_position = mouse_position_world
			mesh.global_position = mouse_position_world
			tank_head.target_global_position = current_mouse_position

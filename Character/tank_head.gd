extends Node3D

@export var rotation_speed:float
@export var mesh : MeshInstance3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
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
			mesh.global_position = mouse_position_world
			var current_tank_position := global_position
			var target_delta :=  mouse_position_world - current_tank_position
			var forward := global_basis.z
			
			var forward_angle_radians := atan2(forward.x,forward.z)
			var target_angle_radians := atan2(target_delta.x, target_delta.z)
			print_debug(target_angle_radians)
			var new_angle := rotate_toward(forward_angle_radians,target_angle_radians,rotation_speed * delta)
			global_rotation.y = new_angle 
			
	
	
	pass
	
func _physics_process(delta: float) -> void:
	pass

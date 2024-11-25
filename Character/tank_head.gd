extends Node3D

@export var rotation_speed:float
@export var mesh : MeshInstance3D
@export var shootPoint : Node3D
@export var bullet_pool : BulletPool
@export var rayCast :RayCast3D

var testBool:=false
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
			var new_angle := rotate_toward(forward_angle_radians,target_angle_radians,rotation_speed * delta)
			global_rotation.y = new_angle 
			
	if Input.is_action_pressed("shoot") :
		if ! rayCast.is_colliding() :
			var new_bullet := bullet_pool._get_next_bullet()
			new_bullet.set_process(true)
			new_bullet.visible = true
			
			var bulletDirection3D :=  (shootPoint.global_position - global_position)
			var bullet_direction_flatt := Vector3(bulletDirection3D.x,0,bulletDirection3D.z).normalized()
			new_bullet.SetStartPosition(shootPoint.global_position, bullet_direction_flatt)
			testBool = true
	
	

	
	
func _physics_process(delta: float) -> void:
	rayCast.force_raycast_update()

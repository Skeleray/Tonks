extends Node3D

class_name TankHead

@export var rotation_speed:float
@export var shootPoint : Node3D
@export var rayCast :RayCast3D
var target_global_position: Vector3
@export var stats : Stats

var testBool:=false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if target_global_position != null :
		var rotate_speed_test := stats._get_stat(str(StateTypes.Tank_Head_Rotate_Speed))
		var current_tank_position := global_position
		var target_delta :=  target_global_position - current_tank_position
		var forward := global_basis.z
		
		var forward_angle_radians := atan2(forward.x,forward.z)
		var target_angle_radians := atan2(target_delta.x, target_delta.z)
		var new_angle := rotate_toward(forward_angle_radians,target_angle_radians,rotate_speed_test * delta)
		global_rotation.y = new_angle 

	
	
func _physics_process(delta: float) -> void:
	rayCast.force_raycast_update()

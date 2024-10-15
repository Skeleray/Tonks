extends CharacterBody3D

# signal health_change

@export var movement_speed: float = 1
@export var rotation_speed: float = 1

func control(delta):
	pass
	
func _physics_process(delta: float) -> void:
	control(delta)
	move_and_slide()
	

extends CharacterBody3D

@export var navigation_agent: NavigationAgent3D

func _physics_process(delta: float) -> void:
	if(!navigation_agent.is_navigation_finished()):
		var destination = navigation_agent.get_next_path_position()
		var local_destination = destination -global_position
		var direction = local_destination.normalized()
		
		velocity = direction * 5.0
		move_and_slide()



func _unhandled_input(event: InputEvent) -> void:
		if event.is_action_pressed("shoot"):
			var random_position := Vector3.ZERO
			random_position.x = randf_range(-5,5)
			random_position.z = randf_range(-5,5)
			navigation_agent.set_target_position(random_position)

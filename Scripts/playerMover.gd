extends "res://Scripts/tankController.gd"

func control(delta):
	var rot_dir = 0
	if Input.is_action_pressed("right"):
		rot_dir -= 1
	if Input.is_action_pressed("left"):
		rot_dir += 1
	rotation.y += rotation_speed * rot_dir * delta
	
	velocity = Vector3()
	if Input.is_action_pressed("forward"):
		velocity = Vector3(0, 0, movement_speed).rotated(Vector3.UP,rotation.y)
	if Input.is_action_pressed("backward"):
		velocity = Vector3(0, 0, -movement_speed).rotated(Vector3.UP,rotation.y)

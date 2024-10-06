extends CharacterBody3D


const SPEED = 5.0
const ROTATESPEED = 0.05

@onready var body := $CollisionShape3D/Body


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	# if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	# 	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "backward")

	var RotateTank = -input_dir.x
	var MoveDirection = (body.transform.basis * Vector3(0, 0, input_dir.y)).normalized()

	if RotateTank:
		body.rotate_y(RotateTank * ROTATESPEED)

	if MoveDirection:
		velocity.x = MoveDirection.x * SPEED
		velocity.z = MoveDirection.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

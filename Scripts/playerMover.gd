extends "res://Scripts/tankController.gd"

#var tankRotation = float

var body

@export var dampening: float = 0.2

var rot = 0

func  _ready() -> void:
	body = get_node("CollisionShape3D/Body")

func control(delta):
	
	var inputVector = getInput() # X sideways, Y forward and back
	
	rot += rotation_speed * -inputVector.x * delta
	body.set_rotation(Vector3(0,rot,0))
	
	velocity = velocity.move_toward(Vector3.ZERO,dampening)
	
	if inputVector.y:
		var forwardVelocity = velocity.rotated(Vector3.UP, rot).y
		forwardVelocity += acceleration_speed * inputVector.y * delta
		forwardVelocity = clampf(forwardVelocity, -maximum_speed, maximum_speed)
		velocity += Vector3(0,0,forwardVelocity).rotated(Vector3.UP, rot)

	if velocity.length() > maximum_speed:
		velocity = velocity.normalized() * maximum_speed


func getInput():
	var inputVector = Vector2.ZERO
	if Input.is_action_pressed("right"):
		inputVector.x += 1
	if Input.is_action_pressed("left"):
		inputVector.x -= 1
	if Input.is_action_pressed("forward"):
		inputVector.y += 1
	if Input.is_action_pressed("backward"):
		inputVector.y -= 1
	return inputVector

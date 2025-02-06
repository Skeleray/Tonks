extends "res://Scripts/tankController.gd"

#var tankRotation = float

var body
@export var dampening: float = 0.2
@export var stat :Stats
var rot = 0
@export var max_movement_speed: float
@export var rotation_speed_test:float
@export var acceleration : float


func  _ready() -> void:
	body = get_node("Smoothing/Body")


func control(delta):

	rotation_speed_test = stat._get_stat(str(StateTypes.Movement_Rotate_speed))
	max_movement_speed = stat._get_stat(str(StateTypes.Max_Movement_Speed))
	acceleration = stat._get_stat(str(StateTypes.Acceleration))
	var inputVector = getInput() # X sideways, Y forward and back
	
	rot += rotation_speed_test * -inputVector.x * delta
	body.set_rotation(Vector3(0,rot,0))
	
	velocity = velocity.move_toward(Vector3.ZERO,dampening)
	
	if inputVector.y:
		var forwardVelocity = velocity.rotated(Vector3.UP, rot).y
		forwardVelocity += acceleration * inputVector.y * delta
		forwardVelocity = clampf(forwardVelocity, -max_movement_speed, max_movement_speed)
		velocity += Vector3(0,0,forwardVelocity).rotated(Vector3.UP, rot)

	if velocity.length() > max_movement_speed:
		velocity = velocity.normalized() * max_movement_speed


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

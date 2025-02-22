extends Node

class_name  BaseStateMachine
@export var start_state : BaseState

var currentState:BaseState



func _ready() -> void:
	currentState = start_state
	currentState.EnterState.call_deferred()

	
func _process(delta: float) -> void:
	var newState:= currentState.ProcessState(delta)
	if  newState != null:
		currentState.ExitState()
		currentState = newState
		currentState.EnterState()
		
		
func _physics_process(delta: float) -> void:
	var newState:= currentState.PhysicsProcessState(delta)
	if  newState != null:
		print("change state")
		currentState.ExitState()
		currentState = newState
		currentState.EnterState()

	

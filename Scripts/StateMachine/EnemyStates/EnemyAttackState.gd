extends BaseState

class_name EnemyAttackState


@export var chaseState : BaseState

var bulletPool : BulletPool

var player_in_area : bool = true

var playerNode : Node3D

@export var character : CharacterBody3D

@export var navigation_agent : NavigationAgent3D

@export var stats : Stats


@export var shootTime : float

var shootTimer : float = 0 

	


func ProcessState(delta:float)->BaseState:
	return null
	
func PhysicsProcessState(delta:float)->BaseState:
	
	
		
	return null
	
func EnterState():
	shootTime = 0
	


func ExitState():
	pass


func _on_velocity_computed(safe_velocity: Vector3):
	character.velocity = safe_velocity
	character.move_and_slide()

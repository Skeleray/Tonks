extends BaseState

class_name EnemyStandAndShootState

var player :  Node3D

@export var chaseState : BaseState

@export var FleeState : BaseState

@export var character : CharacterBody3D

@export var minDistance : float

@export var maxDistance : float


@export var maxShootTime : float
@export var minShootTime : float

signal shot

var shootTimer : float 









func ProcessState(delta:float)->BaseState:
	
	
	return null
	
func PhysicsProcessState(delta:float)->BaseState:
	
	var distanceToPlayerSqr := player.global_position.distance_squared_to(character.global_position)
	if distanceToPlayerSqr < minDistance * minDistance :
		return FleeState
	elif  distanceToPlayerSqr > maxDistance * maxDistance : 
		return chaseState
		
		shootTimer -= delta
		
		if shootTimer < 0:
			shot.emit()
			shootTimer = randf_range(minShootTime,maxShootTime)
		
	
	
	return null
	
func EnterState():
	shootTimer = randf_range(minShootTime,maxShootTime)
	pass



func ExitState():
	pass
	
	

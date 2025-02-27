extends BaseState

class_name EnemyChaseState


@export var patrolState : BaseState

var player_in_area : bool = true

var playerNode : Node3D

@export var character : CharacterBody3D

@export var navigation_agent : NavigationAgent3D

@export var stats : Stats

	


func ProcessState(delta:float)->BaseState:
	return null
	
func PhysicsProcessState(delta:float)->BaseState:
	
	

	
	if player_in_area == false :
		return patrolState
	
	navigation_agent.set_target_position(playerNode.global_position)
	
	if  !navigation_agent.is_navigation_finished():
		var movement_speed = stats._get_stat(str(StateTypes.Max_Movement_Speed))
		var path_position :=  navigation_agent.get_next_path_position()
		var direction := character.global_position.direction_to(path_position) 
		var new_velocity = direction.normalized() * movement_speed
		_on_velocity_computed(new_velocity)
		
	return null
	
func EnterState():
	navigation_agent.set_target_position(playerNode.global_position)
	


func ExitState():
	pass


func _on_velocity_computed(safe_velocity: Vector3):
	character.velocity = safe_velocity
	character.move_and_slide()

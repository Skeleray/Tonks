extends BaseState
class_name EnemyPatrollState


@export var points :  Array[Node3D]
var player_in_area: bool = false
var current_point_index: int = 0

@export var navigation_agent : NavigationAgent3D
@export var character: CharacterBody3D
@export var chase_state : BaseState
@export var stats:Stats

func _ready() -> void:
	navigation_agent.velocity_computed.connect(Callable(_on_velocity_computed))
	navigation_agent.avoidance_enabled = true
func ProcessState(delta:float)->BaseState:
	return null
	
func PhysicsProcessState(delta:float)->BaseState:
	
	if  player_in_area:
		print("chaseState")
		return chase_state;
	
	
	if NavigationServer3D.map_get_iteration_id(navigation_agent.get_navigation_map()) == 0:
		return
	
	if  !navigation_agent.is_navigation_finished():
		var movement_speed = stats._get_stat(str(StateTypes.Max_Movement_Speed))
		var path_position :=  navigation_agent.get_next_path_position()
		var direction := character.global_position.direction_to(path_position) 
		var new_velocity = direction.normalized() * movement_speed
		_on_velocity_computed(new_velocity)
	else :
		
		current_point_index = (current_point_index +1) % points.size()
		var newPosition := points[current_point_index].global_position
		newPosition.y = character.global_position.y
		navigation_agent.set_target_position(newPosition) 	
	
	return null
	
func EnterState():
	var newPosition := points[current_point_index].global_position
	newPosition.y = character.global_position.y
	navigation_agent.set_target_position(newPosition)



func ExitState():
	pass
	
	
func _on_velocity_computed(safe_velocity: Vector3):
	character.velocity = safe_velocity
	character.move_and_slide()

extends BaseBullet

@export var acceleration := 0.0
@export var shape :CollisionShape3D
var shape_test :CollisionShape3D

var current_velocity := Vector3.ZERO

func SetStartPosition(start_position:Vector3, start_direction :Vector3 ) -> void:
	position = start_position
	direction = start_direction.normalized()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	direction =  Vector3(0,-1,0)
	shape_test = shape


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var current_position := position
	current_velocity = current_velocity + direction * acceleration * delta
	var new_position := current_position + current_velocity * delta
	var space_state := get_world_3d().direct_space_state
	var query := PhysicsShapeQueryParameters3D.new()
	query.set_shape_rid(shape)
	query.motion = new_position-current_position
	var result := space_state.intersect_shape(query)
	
	if not result.is_empty():
		var shape : CollisionShape3D
		var dictionary := result[0]
		if dictionary.has("collider"):
			shape = dictionary["collider"]
			print("test")
	else :
		position = new_position
			
	

	
	
	
	

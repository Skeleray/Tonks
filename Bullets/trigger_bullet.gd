extends BaseBullet

@export var acceleration := 0.0
var current_velocity := Vector3.ZERO

func SetStartPosition(start_position:Vector3, start_direction :Vector3 ) -> void:
	position = start_position
	direction = start_direction.normalized()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	direction =  Vector3(0,-1,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var current_position := position
	current_velocity = current_velocity + direction * acceleration * delta
	var new_position := current_position + current_velocity * delta
	position = new_position
	



	


func _on_area_3d_area_entered(area: Area3D) -> void:
	print("test")

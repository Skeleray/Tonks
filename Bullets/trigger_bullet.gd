extends BaseBullet

@export var acceleration := 0.0
@export var max_velocity := 0.0
@export var start_velocity := 0.0
@export var model : Node3D
var current_velocity := Vector3.ZERO

func SetStartPosition(start_position:Vector3, start_direction :Vector3 ) -> void:
	position = start_position
	direction = start_direction.normalized()
	current_velocity = direction * start_velocity
	model.look_at(direction+start_position)


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var current_position := global_position
	current_velocity = current_velocity + direction * acceleration * delta
	if (current_velocity.length_squared() > max_velocity * max_velocity) :
		current_velocity = current_velocity.normalized() * max_velocity
	var new_position := current_position + current_velocity * delta
	position = new_position
	



	


func _on_area_3d_area_entered(area: Area3D) -> void:
	if explosion_pool != null :
		var explosion :=explosion_pool._get_next_explosion()
		explosion.startEffect(global_position)
	visible = false
	set_process(false)


func _on_area_3d_body_entered(body: Node3D) -> void:
	if explosion_pool != null :
		var explosion :=explosion_pool._get_next_explosion()
		explosion.startEffect(global_position)
	visible = false
	set_process(false)

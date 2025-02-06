extends Node3D

@export var speed_multiplier_addative_increase:float

@export var power_up_duration : float


func _on_area_3d_body_entered(body: Node3D) -> void:
	var body_children := body.get_children()
	var stat: Stats
	for body_child in body_children:
		if  is_instance_of(body_child, Stats):
			stat = body_child as Stats
			break
	if stat != null :
		stat._add_timed_buff(str(StateTypes.Max_Movement_Speed), str (BuffTypes.Multiply),speed_multiplier_addative_increase,power_up_duration)
		stat._add_timed_buff(str(StateTypes.Acceleration), str (BuffTypes.Multiply),speed_multiplier_addative_increase,power_up_duration)
		self.queue_free()

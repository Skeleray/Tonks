extends Node3D
class_name BaseBullet
var direction:Vector3
@export var packed_explosion_scene:PackedScene
var explosion_pool : ExplosionPool

func _ready() -> void:
	var explosion_scene := packed_explosion_scene.instantiate()
	get_tree().root.add_child.call_deferred(explosion_scene)

func SetStartPosition(start_position:Vector3, start_direction :Vector3 ) -> void:
	pass

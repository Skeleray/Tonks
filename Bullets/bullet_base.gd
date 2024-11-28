extends Node3D
class_name BaseBullet
var direction:Vector3
@export var packed_explosion_scene:PackedScene
var bullet_explosion : BulletExplosionBase

func _ready() -> void:
	var explosion_scene := packed_explosion_scene.instantiate()
	bullet_explosion = explosion_scene as BulletExplosionBase
	get_tree().root.add_child.call_deferred(explosion_scene)
	bullet_explosion.set_process(false)
	bullet_explosion.visible = false

func SetStartPosition(start_position:Vector3, start_direction :Vector3 ) -> void:
	pass

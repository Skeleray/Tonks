extends "res://Bullets/bullet_explosion_base.gd"

@onready var explodeAnimation = $MeshInstance3D/ExplosionAnimation

func _process(delta):
	if !explodeAnimation.is_playing():
		endEffect()

func startEffect(global_pos: Vector3):
	global_position = global_pos
	explodeAnimation.play("SmallExplosionAnimation")

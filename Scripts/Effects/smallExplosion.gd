extends "res://Bullets/bullet_explosion_base.gd"

@onready var explodeAnimation = $MeshInstance3D/ExplosionAnimation

func _process(delta):
	if !explodeAnimation.is_playing():
		endEffect()

func startEffect(pos: Vector3):
	explodeAnimation.play("SmallExplosionAnimation")

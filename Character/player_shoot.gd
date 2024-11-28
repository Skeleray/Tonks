extends Node3D

class_name PlayerShoot

@export var tank_head :TankHead

@export var bullet_pool: BulletPool

@export var shoot_time :float = 0
var shoot_timer:float = 0

func _process(delta: float) -> void:
	shoot_timer -= delta
	if Input.is_action_pressed("shoot") :
			if ! tank_head.rayCast.is_colliding() and shoot_timer < 0:
				var shoot_point := tank_head.shootPoint
				var new_bullet := bullet_pool._get_next_bullet()
				new_bullet.set_process(true)
				new_bullet.visible = true
				shoot_timer = shoot_time
				var bulletDirection3D :=  (shoot_point.global_position - global_position)
				var bullet_direction_flatt := Vector3(bulletDirection3D.x,0,bulletDirection3D.z).normalized()
				new_bullet.SetStartPosition(shoot_point.global_position, bullet_direction_flatt)

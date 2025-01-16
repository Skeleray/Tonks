extends Node3D
class_name BulletPool
@export var bullet: PackedScene
@export var explosion_pool : ExplosionPool
var bullets :Array[BaseBullet] = []
var current_index := 0

@export var number_of_bullets : int 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(0,number_of_bullets) :
		var bullet_object  :=  bullet.instantiate()
		get_tree().root.add_child.call_deferred(bullet_object)
		bullets.append(bullet_object as BaseBullet)
		var bullet_base := bullet_object as BaseBullet
		if bullet_base != null and explosion_pool != null:
			bullet_base.explosion_pool = explosion_pool
		bullet_object.set_visible(false)
		bullet_object.set_process(false)
		

 


func _get_next_bullet() -> BaseBullet :
	var return_bullet := bullets[current_index]  
	current_index = current_index +1
	current_index = current_index % bullets.size()
	return return_bullet

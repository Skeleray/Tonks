extends Node3D
class_name BulletPool
@export var bullet: PackedScene

var bullets :Array[BaseBullet] = []
var current_index := 0

@export var number_of_bullets : int 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(0,number_of_bullets) :
		var test  :=  bullet.instantiate()
		get_tree().root.add_child.call_deferred(test)
		bullets.append(test as BaseBullet)
		var test2 := test as BaseBullet
		test.set_visible(false)
		test.set_process(false)
		

 


func _get_next_bullet() -> BaseBullet :
	var return_bullet := bullets[current_index]  
	current_index = current_index +1
	current_index = current_index % bullets.size()
	return return_bullet
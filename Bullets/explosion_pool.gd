extends Node3D
class_name ExplosionPool

@export var explosion: PackedScene

var bullets :Array[BaseExplosion] = []
var current_index := 0

@export var number_of_explosions : int 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(0,number_of_explosions) :
		var test  :=  explosion.instantiate()
		get_tree().root.add_child.call_deferred(test)
		bullets.append(test as BaseExplosion)
		var test2 := test as BaseExplosion
		test.set_visible(false)
		test.set_process(false)
		

 


func _get_next_explosion() -> BaseExplosion :
	var return_bullet := bullets[current_index]  
	current_index = current_index +1
	current_index = current_index % bullets.size()
	return return_bullet

extends Node3D

class_name BaseExplosion
@export var model: MeshInstance3D

func doEffect(pos: Vector3):
	visible = true
	startEffect(pos)

func startEffect(global_pos: Vector3):
	pass

func endEffect():
	visible = false
	set_process(false)

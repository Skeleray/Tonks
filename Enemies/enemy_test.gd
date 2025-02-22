extends Node3D

class_name enemytest

@export var patrollPoints: Array[Node3D]
@export var patrollState:EnemyPatrollState
@export var chaseState:EnemyChaseState
var playerInArea : bool
@export var player:Node3D

func _ready() -> void:
	patrollState.points = patrollPoints
	chaseState.playerNode = player


func _on_area_3d_player_body_entered(body: Node3D) -> void:
	patrollState.player_in_area = true
	chaseState.player_in_area = true


func _on_area_3d_player_body_exited(body: Node3D) -> void:
	patrollState.player_in_area = false
	chaseState.player_in_area = false

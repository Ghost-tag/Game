extends Node2D

func playerToGhost(body):
	var ghost = load("res://scenes/player_ghost.tscn").instantiate()
	add_child(ghost)
	$CharacterBody2D2.inControl = true
	$CharacterBody2D2/Camera2D.enabled = true
	body.queue_free()

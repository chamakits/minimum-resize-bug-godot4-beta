extends Node2D

func _ready():
	print("Ready main.")

func _input(event: InputEvent):
	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()

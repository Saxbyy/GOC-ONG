extends Control

func _ready():
	$CanvasLayer/VBoxContainer/StartButton.pressed.connect(_on_start_pressed)

func _on_start_pressed():
	GameManager.score = 0
	get_tree().change_scene_to_file("res://scenes/Main.tscn")

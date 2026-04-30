extends Control

func _ready():
	$CanvasLayer/VBoxContainer/RetryButton.pressed.connect(_on_retry_pressed)
	$CanvasLayer/VBoxContainer/ScoreLabel.text = "Your Score: %d" % GameManager.score

func _on_retry_pressed():
	GameManager.score = 0
	get_tree().change_scene_to_file("res://scenes/Main.tscn")

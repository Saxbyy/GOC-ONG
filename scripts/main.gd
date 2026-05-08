extends Control

func _ready():
	$BackgroundMusic.play()
	$Spawner.process_mode = Node.PROCESS_MODE_DISABLED
	$Player.process_mode = Node.PROCESS_MODE_DISABLED
	$HUD.hide()
	start_countdown()

func start_countdown():
	var images = [
		preload("res://assets/ui/countdown/3.png"),
		preload("res://assets/ui/countdown/2.png"),
		preload("res://assets/ui/countdown/1.png"),
		preload("res://assets/ui/countdown/dodge.png")
	]
	for image in images:
		$Countdown/CountdownImage.texture = image
		$Countdown/CountdownImage.show()
		$Countdown/CountdownImage.scale = Vector2(0.75, 0.75)
		await get_tree().create_timer(1.0).timeout
	$Countdown/CountdownImage.hide()
	$HUD.show()
	$Spawner.process_mode = Node.PROCESS_MODE_INHERIT
	$Player.process_mode = Node.PROCESS_MODE_INHERIT

extends Area2D

var speed = 400.0
var direction = Vector2.ZERO

func _ready():
	body_entered.connect(_on_body_entered)
	$SpawnSound.play()
	$AnimatedSprite2D.play("rocket blue")
	
	var side = randi() % 4
	match side:
		0: # Top
			global_position = Vector2(randf_range(0, 1659), 0)
			direction = Vector2(0, 1)
			rotation = deg_to_rad(270)
		1: # Bottom
			global_position = Vector2(randf_range(0, 1659), 906)
			direction = Vector2(0, -1)
			rotation = deg_to_rad(90)
		2: # Left
			global_position = Vector2(0, randf_range(0, 906))
			direction = Vector2(1, 0)
			rotation = deg_to_rad(180)
		3: # Right
			global_position = Vector2(1659, randf_range(0, 906))
			direction = Vector2(-1, 0)
			rotation = deg_to_rad(0)

func _physics_process(_delta):
	global_position += direction * speed * _delta
	
	if global_position.x < -50 or global_position.x > 1709:
		queue_free()
	if global_position.y < -50 or global_position.y > 956:
		queue_free()

func _on_body_entered(body):
	if body.name == "Player":
		var hit_sound = AudioStreamPlayer.new()
		hit_sound.stream = load("res://assets/sfx/YOUR_HIT_SOUND.mp3")
		get_tree().root.add_child(hit_sound)
		hit_sound.play()
		get_tree().call_deferred("change_scene_to_file", "res://scenes/GameOver.tscn")

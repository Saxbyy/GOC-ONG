extends Area2D

@export var explosion_scene: PackedScene

var speed = 250.0
var direction = Vector2.ZERO

func _ready():
	body_entered.connect(_on_body_entered)
	$SpawnSound.play()
	$AnimatedSprite2D.play("roll")
	
	# Random spawn from edges
	var side = randi() % 4
	match side:
		0: # Top
			global_position = Vector2(randf_range(50, 1609), 0)
			direction = Vector2(randf_range(-1, 1), 1).normalized()
		1: # Bottom
			global_position = Vector2(randf_range(50, 1609), 906)
			direction = Vector2(randf_range(-1, 1), -1).normalized()
		2: # Left
			global_position = Vector2(0, randf_range(50, 856))
			direction = Vector2(1, randf_range(-1, 1)).normalized()
		3: # Right
			global_position = Vector2(1659, randf_range(50, 856))
			direction = Vector2(-1, randf_range(-1, 1)).normalized()
	
	# 5-8 secs tapos sasabog
	var wait_time = randf_range(5.0, 8.0)
	await get_tree().create_timer(wait_time).timeout
	explode()

func _physics_process(_delta):
	global_position += direction * speed * _delta
	
	# Rotate para magmukhang gumugulong
	rotation += 3.0 * _delta

func explode():
	if explosion_scene:
		var explosion = explosion_scene.instantiate()
		explosion.global_position = global_position
		get_parent().add_child(explosion)
	queue_free()

func _on_body_entered(body):
	if body.name == "Player":
		var hit_sound = AudioStreamPlayer.new()
		hit_sound.stream = load("res://assets/sfx/YOUR_HIT_SOUND.mp3")
		get_tree().root.add_child(hit_sound)
		hit_sound.play()
		get_tree().call_deferred("change_scene_to_file", "res://scenes/GameOver.tscn")

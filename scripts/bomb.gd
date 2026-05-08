extends Area2D

@export var explosion_scene: PackedScene

func _ready():
	var rand_x = randf_range(50, 1609)
	var rand_y = randf_range(50, 856)
	global_position = Vector2(rand_x, rand_y)
	body_entered.connect(_on_body_entered)
	$AnimatedSprite2D.play("bomb")
	
	var wait_time = randf_range(5.0, 8.0)
	await get_tree().create_timer(wait_time).timeout
	explode()

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

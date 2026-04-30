extends Area2D

var speed = 200.0
var max_lifetime = 0.0
var player = null
var disappearing = false

func _ready():
	body_entered.connect(_on_body_entered)
	$AnimatedSprite2D.play("roll")
	
	global_position = Vector2(
		randf_range(50, 1609),
		randf_range(50, 856)
	)
	
	player = get_tree().get_first_node_in_group("player")
	
	max_lifetime = randf_range(8.0, 10.0)
	await get_tree().create_timer(max_lifetime).timeout
	disappear()

func disappear():
	disappearing = true
	speed = 0.0
	$AnimatedSprite2D.play("disappear")
	$AnimatedSprite2D.animation_finished.connect(_on_disappear_finished)

func _on_disappear_finished():
	queue_free()

func _physics_process(_delta):
	if disappearing:
		return
	
	if player and is_instance_valid(player):
		var dir = (player.global_position - global_position).normalized()
		global_position += dir * speed * _delta
		rotation = dir.angle()

func _on_body_entered(body):
	if body.name == "Player":
		get_tree().call_deferred("change_scene_to_file", "res://scenes/GameOver.tscn")

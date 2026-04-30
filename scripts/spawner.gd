extends Node2D

@export var bomb_scene: PackedScene
@export var rocket_scene: PackedScene
@export var rolling_bomb_scene: PackedScene
@export var skull_scene: PackedScene

var bomb_timer = 0.0
var rocket_timer = 0.0
var rolling_bomb_timer = 0.0
var skull_timer = 0.0

var bomb_interval = 5.0
var rocket_interval = 4.0
var rolling_bomb_interval = 6.0
var skull_interval = 8.0

var difficulty_timer = 0.0

func _process(_delta):
	difficulty_timer += _delta
	
	# Bawat 10 seconds, mas mabilis ang spawn
	bomb_interval = max(2.0, 5.0 - (difficulty_timer / 60.0))
	rocket_interval = max(1.5, 4.0 - (difficulty_timer / 60.0))
	rolling_bomb_interval = max(2.5, 6.0 - (difficulty_timer / 60.0))
	skull_interval = max(3.0, 8.0 - (difficulty_timer / 60.0))
	
	bomb_timer += _delta
	rocket_timer += _delta
	rolling_bomb_timer += _delta
	skull_timer += _delta
	
	if bomb_timer >= bomb_interval:
		bomb_timer = 0.0
		spawn_bomb()
	
	if rocket_timer >= rocket_interval:
		rocket_timer = 0.0
		spawn_rocket()
	
	if rolling_bomb_timer >= rolling_bomb_interval:
		rolling_bomb_timer = 0.0
		spawn_rolling_bomb()
	
	if skull_timer >= skull_interval:
		skull_timer = 0.0
		spawn_skull()

func spawn_bomb():
	var bomb = bomb_scene.instantiate()
	add_child(bomb)

func spawn_rocket():
	var rocket = rocket_scene.instantiate()
	add_child(rocket)

func spawn_rolling_bomb():
	var rolling_bomb = rolling_bomb_scene.instantiate()
	add_child(rolling_bomb)

func spawn_skull():
	var skull = skull_scene.instantiate()
	add_child(skull)

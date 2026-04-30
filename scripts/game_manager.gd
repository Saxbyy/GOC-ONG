extends Node

var score = 0
var score_timer = 0.0

func _process(delta):
	score_timer += delta
	score += int(score_timer * 10)
	score_timer = fmod(score_timer, 0.1)

extends CharacterBody2D

const SPEED = 300.0

func _physics_process(_delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		$AnimatedSprite2D.play("run_right")
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1
		$AnimatedSprite2D.play("run_left")
	elif Input.is_action_pressed("ui_down"):
		direction.y += 1
		$AnimatedSprite2D.play("run_down")
	elif Input.is_action_pressed("ui_up"):
		direction.y -= 1
		$AnimatedSprite2D.play("run_up")
	else:
		_play_idle()
	
	if direction != Vector2.ZERO:
		direction = direction.normalized()
	
	velocity = direction * SPEED
	move_and_slide()

func _play_idle():
	var current = $AnimatedSprite2D.animation
	if current == "run_right":
		$AnimatedSprite2D.play("idle_right")
	elif current == "run_left":
		$AnimatedSprite2D.play("idle_left")
	elif current == "run_down":
		$AnimatedSprite2D.play("idle_down")
	elif current == "run_up":
		$AnimatedSprite2D.play("idle_up")

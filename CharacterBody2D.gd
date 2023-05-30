extends CharacterBody2D

var run_speed = 350
var jump_speed = -1000
var gravity = 2500
@onready var _animated_sprite = $AnimatedSprite2D

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_pressed('ui_select')
	
	if is_on_floor() and jump:
		velocity.y = jump_speed
		$AnimatedSprite2D.play("sprite2-jump")
	elif right:
		$AnimatedSprite2D.flip_h = false
		velocity.x += run_speed
		if is_on_floor():
			$AnimatedSprite2D.play("sprite2-run")
		else:
			$AnimatedSprite2D.play("sprite2-jump")
	elif left:
		$AnimatedSprite2D.flip_h = true
		velocity.x -= run_speed
		if is_on_floor():
			$AnimatedSprite2D.play("sprite2-run")
		else:
			$AnimatedSprite2D.play("sprite2-jump")
	else:
		if is_on_floor():
			$AnimatedSprite2D.play("sprite2-idle")
		else:
			$AnimatedSprite2D.play("sprite2-jump")


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	get_input()
	move_and_slide()


extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	
	var direction = Input.get_axis("ui_left", "ui_right")
	# Get the input direction and handle the movement/deceleration.
	if direction:
		$AnimatedSprite2D.flip_h = direction < 0
		# control sprite direction
		if is_on_floor():
			$AnimatedSprite2D.play("sprite2-run")
			# control sprite change to run on floor
		else:
			$AnimatedSprite2D.play("sprite2-jump")
			# control sprite change to jump on jump
		velocity.x = direction * SPEED
	else:
		if is_on_floor():
			_animated_sprite.play("sprite2-idle")
			#back to idle state
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
	# Add the gravity.
	if not is_on_floor():
		# haven't implement fall animation
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_pressed("ui_accept"):
		# changed from action_just_pressed
		_animated_sprite.play("sprite2-jump")
		#control sprite jump
		if is_on_floor():
			velocity.y = JUMP_VELOCITY

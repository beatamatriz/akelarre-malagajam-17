extends CharacterBody2D

const speed : float = 600.0
const jump_velocity : float = -666.0
const double_jump_velocity : float = -599.0

var can_double_jump : bool = false;
var last_check_point
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta;
	else:
		can_double_jump = true;

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if (is_on_floor()):
			$Animation.stop()
			$Animation.play("jump")
			velocity.y = jump_velocity
		elif (can_double_jump):
			$Animation.stop()
			$Animation.play("jump")
			velocity.y = double_jump_velocity;
			can_double_jump = false;
	else:
		if (is_on_floor()):
			if velocity.x != 0:
				$Animation.play("walk")
			else:
				$Animation.play("idle")
		elif (velocity.y > 0):
			$Animation.play("fall")			

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	if velocity.x < 0:
		$Sprite.set_flip_h(false)
	elif velocity.x > 0:
		$Sprite.set_flip_h(true)
	move_and_slide()

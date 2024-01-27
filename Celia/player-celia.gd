extends CharacterBody2D


const speed : float = 180.0
const jump_velocity : float = -200.0
const double_jump_velocity : float = -150.0

var can_double_jump : bool = false;

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
			velocity.y = jump_velocity
		elif (can_double_jump):
			velocity.y = double_jump_velocity;
			can_double_jump = false;
			

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()

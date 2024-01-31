extends CharacterBody2D

#const speed : float = 600.0
#const jump_velocity : float = -666.0
#const double_jump_velocity : float = -599.0

@export var speed : float
@export var jump_velocity : float
@export var double_jump_velocity : float

var can_double_jump : bool = false
var last_checkpoint
var dead : bool = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func process_movement(delta):
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
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta;
	else:
		can_double_jump = true;

	if not dead:
		process_movement(delta)

	if velocity.x < 0:
		$Sprite.set_flip_h(false)
		$death_shake.set_flip_h(false)
		$death_fall.set_flip_h(false)
		$death_fall.position.x = -119
		$death_fall.position.y = -5
	elif velocity.x > 0:
		$Sprite.set_flip_h(true)
		$death_shake.set_flip_h(true)
		$death_fall.set_flip_h(true)
		$death_fall.position.x = 119
		$death_fall.position.y = 5
	move_and_slide()

func update_checkpoint():
	last_checkpoint = position

func die():
	#avoid audio and animation spam when draged by plataform over axones
	$".".set_collision_layer_value(1,false)
	dead = true
	velocity.x = 0
	#Hide sprite for the animations
	$Sprite.set_visible(false)
	#Play death_shake animation
	$death_shake.set_visible(true)
	$Animation.play("death_shake")
	await get_tree().create_timer(1.5).timeout
	$death_shake.set_visible(false)
	
	#Play death_fall animation
	$death_fall.set_visible(true)
	$Animation.play("death_fall")
	await get_tree().create_timer(1.3).timeout
	$death_fall.set_visible(false)
	
	$Sprite.set_visible(true)
	position = last_checkpoint
	dead = false
	await get_tree().create_timer(1).timeout
	$".".set_collision_layer_value(1,true)
	pass

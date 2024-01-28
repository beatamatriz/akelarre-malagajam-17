extends Area2D

var active : bool = false

func _ready():
	set_inactive()

func _physics_process(delta):
	if not active and not $Animation.get_current_animation() == "inactive":
		$SpriteActive.set_visible(false)
		$SpriteInactive.set_visible(true)
		$Animation.play("inactive")

func set_inactive():
	active = false
	$SpriteActive.set_visible(false)
	$SpriteInactive.set_visible(true)
	$Animation.play("inactive")

func set_active(body):
	active = true
	body.update_checkpoint()
	CheckpointsGlobal.spawn = global_position
	$SpriteInactive.set_visible(false)
	$SpriteActive.set_visible(true)
	$Animation.play("active")
	get_parent().clear_last_checkpoint(self)
	

func _on_body_entered(body):
	if not active and body.name == "Player":
		set_active(body)

extends Area2D

var active

func _ready():
	active = false
	$SpriteActive.set_visible(false)
	$SpriteInactive.set_visible(true)
	$Animation.play("inactive")

func _on_body_entered(body):
	if not active and body.name == "Player":
		active = true
		CheckpointsGlobal.spawn = global_position
		$SpriteInactive.set_visible(false)
		$SpriteActive.set_visible(true)
		$Animation.play("active")

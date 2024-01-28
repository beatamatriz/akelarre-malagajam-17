extends Area2D

func _on_body_entered(body):
	$inactive.set_visible(false)
	$active.set_visible(true)

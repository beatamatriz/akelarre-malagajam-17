extends Area2D

func _on_body_entered(body):
	$inactive.setvisible(false)
	$active.setvisible(true)

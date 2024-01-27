extends Area2D

func _on_body_entered(body):
	CheckpointsGlobal.spawn = global_position

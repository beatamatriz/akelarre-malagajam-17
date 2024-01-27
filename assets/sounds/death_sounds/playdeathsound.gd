extends Node

func _playd():
	$AudioStreamPlayer.play()
	await get_tree().create_timer(0.25).timeout

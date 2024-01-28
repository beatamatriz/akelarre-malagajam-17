extends Area2D

var rng = RandomNumberGenerator.new()
var my_random_number = int(rng.randf_range(1, 4))
	
func _on_body_entered(_body):
	if my_random_number == 1:
		$AudioStreamPlayer.play()
	elif my_random_number == 2:
		$AudioStreamPlayer2.play()
	elif my_random_number == 3:
		$AudioStreamPlayer3.play()
	await get_tree().create_timer(0.25).timeout
	get_tree().reload_cdurrent_scene()

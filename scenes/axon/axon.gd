extends Area2D

var rng = RandomNumberGenerator.new()
var my_random_number = int(rng.randf_range(1, 4))
	
func _on_body_entered(body):
	if body.name == "Player":
		if my_random_number == 1:
			$AudioStreamPlayer.play()
		elif my_random_number == 2:
			$AudioStreamPlayer2.play()
		elif my_random_number == 3:
			$AudioStreamPlayer3.play()
		body.die()
		#get_tree().quit()


extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		$find_the_butttom.play()
		remove_child($CollisionShape2D)
		$"../../blocked_way".queue_free()
		
func _on_find_the_butttom_finished():
	queue_free()

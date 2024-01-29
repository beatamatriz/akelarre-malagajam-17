extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		$inactive.set_visible(false)
		$active.set_visible(true)

		$Cortisol_subir.play()

		remove_child($CollisionShape2D)
		
		$"../Plataforms_to_dopamina/hidden_plataform_todelete".queue_free()

extends Area2D

@onready var player = $Player
@onready var starting_spawn = $StartingSpawn

func _on_body_entered(body):
	get_tree().quit()
	#get_tree().reload_current_scene()
	# que pasa cuando el jugador toca a dopamina

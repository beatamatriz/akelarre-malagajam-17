extends Area2D

@onready var animation_player = $AnimationPlayer
@onready var starting_spawn = $StartingSpawn

func _ready():
	animation_player.play("active")

func _on_body_entered(body):
	get_tree().quit()
	#get_tree().reload_current_scene()
	# que pasa cuando el jugador toca a dopamina

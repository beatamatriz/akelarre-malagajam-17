extends Area2D

@onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.play("active")

func _on_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://scenes/final_scene/final_scene.tscn")

extends Control

func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level/level.tscn")

func _process(delta):
	if Input.is_action_just_pressed("esc"):
		GlobalFunctions.closegame()

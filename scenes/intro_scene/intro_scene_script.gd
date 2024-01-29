extends Control

func _process(delta): 
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")

func _on_video_stream_player_finished():
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")

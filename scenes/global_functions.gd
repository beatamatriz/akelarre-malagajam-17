extends Node

func closegame():
	get_tree().quit()
	
func resetgame():
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn")

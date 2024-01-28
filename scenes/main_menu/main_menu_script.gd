extends Control

var main_level = preload("res://scenes/level/level.tscn").instantiate()

func _on_texture_button_pressed():
	get_tree().root.add_child(main_level)

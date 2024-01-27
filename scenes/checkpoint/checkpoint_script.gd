extends Area2D

@onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.play("inactive")

func _on_body_entered(body):
	CheckpointsGlobal.spawn = global_position
	animation_player.play("active")

extends Node2D

@onready var player = $TileMap/Player
@onready var starting_spawn = $StartingSpawn

func _ready():
	if CheckpointsGlobal.spawn:
		player.global_position = CheckpointsGlobal.spawn
	else:
		player.global_position = starting_spawn.global_position

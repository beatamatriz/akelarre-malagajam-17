extends Node2D

@onready var player = $Player
@onready var starting_spawn = $StartingSpawn

func _ready():
	if CheckpointsGlobal.spawn:
		player.global_position = CheckpointsGlobal.spawn
	else:
		player.global_position = starting_spawn.global_position

func _process(delta): 
	if Input.is_action_just_pressed("esc"):
		GlobalFunctions.resetgame()
#func _process(delta):
	#if player.position.y > 300:
		#if CheckpointsGlobal.spawn:
			#player.global_position = CheckpointsGlobal.spawn
		#else:
			#player.global_position = starting_spawn.global_position

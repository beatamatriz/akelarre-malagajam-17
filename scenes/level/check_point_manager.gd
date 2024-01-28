extends Node2D

var last_checkpoint
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func clear_last_checkpoint(checkpoint):
	if last_checkpoint:
		last_checkpoint.set_inactive()
	last_checkpoint = checkpoint


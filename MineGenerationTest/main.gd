extends Node2D

var mine = preload("res://mine_tiles.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("enter"):
		get_child(-1).queue_free()
		add_child(mine.instantiate())
		

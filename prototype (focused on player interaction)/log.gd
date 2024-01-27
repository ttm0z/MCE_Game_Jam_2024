extends Node2D

var followPlayer = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if followPlayer == true:
		position = Global.playerPos
		
func drop(nearCampfire):
	if nearCampfire == false:
		followPlayer = false
		position.y += 10
	else:
		#put in fire
		Global.campfire.grow()
		queue_free()

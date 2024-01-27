extends Node2D

@export var sprite: Sprite2D

var log = preload("res://log.tscn")
var spriteRects = [Rect2(0,0,96,96), Rect2(96, 0, 96, 96), Rect2(192, 0, 96, 96)]

var treeHealth = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	z_index = int(position.y/10)
	spriteRects.shuffle()
	sprite.region_rect = spriteRects[0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func takeDamage():
	treeHealth -=1
	if treeHealth == 0:
		var newLog = log.instantiate()
		newLog.position = global_position
		get_parent().add_child(newLog)
		#Global.treesDestroyedList.append(self)
		queue_free()
		

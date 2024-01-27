extends Node2D

@export var sprite: AnimatedSprite2D
var growFactor: float = 1.0
var prevScales = []
# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play()
	Global.campfire = self
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func grow():
	#scale*=1.2
	#Global.camera.zoom/=1.2
	prevScales.append(scale)
	scale *= ((1+growFactor/4))
	#Global.camera.zoom /= ((1+growFactor/4))
	
	growFactor/=2
	
	
	
	print(growFactor)
	



func _on_timer_timeout():
	scale -= Vector2(0.01,0.01)
	#Global.camera.zoom += Vector2(0.01,0.01)
	
	if scale.x<0.5:
		#fire stops
		pass
	if prevScales.size()>0:
		if scale<prevScales[-1]:
			growFactor*=2
			prevScales.remove_at(len(prevScales)-1)
			print(prevScales)

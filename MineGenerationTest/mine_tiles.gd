extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	var noise = FastNoiseLite.new()
	noise.seed = randi()
	noise.frequency+=0.01
	print(noise.frequency)
	for y in range(250):
		for x in range(250):
			var newNoiseNumber = noise.get_noise_2d(x,y)
			if newNoiseNumber>0.05:
				set_cell (0, Vector2i (x,y), 0, Vector2i(1, 1))
			elif newNoiseNumber>0.01:
				set_cell (0, Vector2i (x,y), 0, Vector2i(3, 2))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

extends CharacterBody2D


@export var speed = 200

var treesInAreaArray = []
var currentlyHeldLog = null
var logsInArea = []

func _process(delta):
	z_index = int(position.y/10)
	Global.playerPos = global_position
	if Input.is_action_just_pressed("swing_axe") and treesInAreaArray.size()>0:
		treesInAreaArray[-1].takeDamage()
	if Input.is_action_just_pressed("pickup") and currentlyHeldLog == null and logsInArea.size()>0:
		currentlyHeldLog = logsInArea[-1]
		logsInArea[-1].followPlayer = true
		speed = 100
	elif Input.is_action_just_pressed("pickup") and currentlyHeldLog != null:
		currentlyHeldLog.drop()
		logsInArea.insert(0,currentlyHeldLog)
		logsInArea.remove_at(len(logsInArea)-1)
		currentlyHeldLog = null
		speed = 200

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed


func _physics_process(delta):
	get_input()
	move_and_slide()


func _on_area_2d_area_entered(area):
	if area.is_in_group("tree"):
		treesInAreaArray.append(area.get_parent())
		#print(treesInAreaArray)
	elif area.is_in_group("log"):
		logsInArea.append(area.get_parent())
		

func _on_area_2d_area_exited(area):
	if area.is_in_group("tree"):
		for i in range(treesInAreaArray.size()):
			if treesInAreaArray[i] == area.get_parent():
				treesInAreaArray.remove_at(i)
				break

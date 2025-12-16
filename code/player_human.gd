extends CharacterBody2D

var items = []
var itemNames = ["holy water", "can"]
var speed = 300.0
var top_speed = 400
var xDirection = 0
var yDirection = 0
var speedForce = 30
var stopForce = 30
var inControl = true

func useItem():
	if items.size() > 0:
		print("used " + itemNames[items[items.size() - 1]])
		items.pop_back()

	

func direction():
		var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		if (input_direction.x != 0 || input_direction.y !=0):
			if speed >= top_speed:
				velocity.x = input_direction.x * top_speed
				xDirection = input_direction.x
				velocity.y = input_direction.y * top_speed
				yDirection = input_direction.y
			else:
				velocity.x = input_direction.x * speed
				speed += speedForce
				xDirection = input_direction.x
				velocity.y = input_direction.y * speed
				speed += speedForce
				yDirection = input_direction.y
			
		elif input_direction.x == 0 && input_direction.y == 0 && speed > 0:
			velocity.x = speed * xDirection
			velocity.y = speed * yDirection
			speed -= stopForce
		elif input_direction.x == 0 && speed <= 0:
			velocity.y = 0
		elif input_direction.y == 0 && speed <= 0:
			velocity.x = 0

func addItem(id):
	items.push_back(id)

func _physics_process(_delta: float) -> void:
	if inControl == true:
		direction()
		move_and_slide()
		useItem()

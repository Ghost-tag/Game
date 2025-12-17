extends Node2D
signal pickUp
var canPickup = false
var itemNumber
var player

func _on_area_2d_body_entered(body, itemId):
	if body.is_in_group("player"):
		$RichTextLabel.visible = true
		canPickup = true
		itemNumber = itemId
		player = body



func _physics_process(delta):
	if canPickup:
		if Input.is_action_pressed("menu_actions"):
			player.addItem(itemNumber)
			canPickup = false

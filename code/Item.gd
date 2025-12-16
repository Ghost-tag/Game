extends Node2D
signal pickUp

func _on_area_2d_body_entered(body, itemId):
	if body.is_in_group("player"):
		$RichTextLabel.visible = true
		if Input.is_action_pressed("menu_actions"):
			body.addItem(itemId)

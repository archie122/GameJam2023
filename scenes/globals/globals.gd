extends Node

var player_position: Vector2 = Vector2(0,0)

var item_in: Array = [0,0,0,0,0,0]
var item_in_names: Array = ["wood", "stone", "metal", "leather", "raw meat", "cooked meat"]

func display_item_in():
	var size = 0
	while size != item_in.size():
		print(item_in_names[size],": ",item_in[size])
		size += 1
	

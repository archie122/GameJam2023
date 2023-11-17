extends Node

var player_position: Vector2 = Vector2(0,0)

signal spawn_wood(pos)
signal spawn_stone(pos)
signal spawn_steel(pos)
signal spawn_leather_and_raw_meat(pos)

var armour: int = 0
# 0 = none, 1 = leather, 2 = steel

var death: bool = false

var player_health: int = 1
var player_max_health: int = 1
var spawn: Array = [false,false,false,false,false,false]
var item_in: Array = [200,70,100,500,5,0]
var item_in_names: Array = ["wood", "stone", "metal", "leather", "raw meat", "cooked meat"]

func display_item_in():
	var size = 0
	while size != item_in.size():
		print(item_in_names[size],": ",item_in[size])
		size += 1
	

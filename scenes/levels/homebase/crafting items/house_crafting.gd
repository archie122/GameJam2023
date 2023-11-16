extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_1_pressed():
	if(Globals.item_in[0] >= 200):
		$"crafting bench".show()
	else:
		print("you do not have the required amount")


func _on_button_2_pressed():
	if(Globals.item_in[1] >= 70):
		$furance2.show()
	else:
		print("you do not have the required amount")

#open the furance crafting options
func _on_button_3_pressed():
	TransisionLayer.change_scean("res://scenes/levels/parent/parent_level.tscn")

#open the armour crafting menu
func _on_button_4_pressed():
	TransisionLayer.change_scean("res://scenes/levels/forest/forest1/forest.tscn")

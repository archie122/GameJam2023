extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_leather_pressed():
	if(Globals.item_in[3] >= 50):
		Globals.armour = 1
		Globals.item_in[3] -= 50
		$HBoxContainer/VBoxContainer/leather.hide()
		$HBoxContainer/VBoxContainer/equipped.show()
		
		if $"HBoxContainer/VBoxContainer2/equipped steel".visible:
			$"HBoxContainer/VBoxContainer2/equipped steel".text = "Equip"
	else:
		$"can't make".start()
		$Label.show()


func _on_steel_pressed():
	if(Globals.item_in[3] >= 50 and Globals.item_in[2] >= 75):
		Globals.armour = 2
		Globals.item_in[3] -= 50
		Globals.item_in[2] -= 75
		$"HBoxContainer/VBoxContainer2/equipped steel".show()
		$HBoxContainer/VBoxContainer2/steel.hide()
		
		if $HBoxContainer/VBoxContainer/equipped.visible:
			$HBoxContainer/VBoxContainer/equipped.text = "Equip"
	else:
		$"can't make".start()
		$Label.show()


func _on_cant_make_timeout():
	$Label.hide()


func _on_exit_pressed():
	$".".hide()


func _on_equipped_pressed():
	Globals.armour = 1
	$"HBoxContainer/VBoxContainer2/equipped steel".text = "Equip"
	$HBoxContainer/VBoxContainer/equipped.text = "Equipped"


func _on_equipped_steel_pressed():
	Globals.armour = 2
	$HBoxContainer/VBoxContainer/equipped.text = "Equip"
	$"HBoxContainer/VBoxContainer2/equipped steel".text = "Equipped"

extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$items/VBoxContainer/wood/Label.text = var_to_str(Globals.item_in[0])
	$items/VBoxContainer/stone/Label.text = var_to_str(Globals.item_in[1])
	$items/VBoxContainer/steel/Label.text = var_to_str(Globals.item_in[2])
	$items/VBoxContainer/leather/Label.text = var_to_str(Globals.item_in[3])
	$"items/VBoxContainer/raw meat/Label".text = var_to_str(Globals.item_in[4])
	$"items/VBoxContainer/cooked meat/Label".text = var_to_str(Globals.item_in[5])
	$"health bar/TextureProgressBar".value = ((((float)(Globals.player_health))/((float)(Globals.player_max_health)))*100)

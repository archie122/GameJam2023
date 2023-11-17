extends Control



func _ready():
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.


func start_timer():
	show()
	$"menu open".start()
	Globals.death = true
	drop_items()

func drop_items():
	var items: int = 5
	Globals.display_item_in()
	if(Globals.death):
		while(items != -1):
			Globals.item_in[items] = roundi(Globals.item_in[items]/2)
			items -= 1
			print(roundi(Globals.item_in[items]/2))
		Globals.death = false
	Globals.display_item_in()

func _on_menu_open_timeout():
	
	hide()

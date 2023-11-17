extends Control

@onready var pause_menu = $"pause menu"
var paused:bool = false
var first: bool = true
# Called when the node enters the scene tree for the first time.
func _ready():
	if(first):
		$"CanvasLayer/thing to say".explore()
		first = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("pause")):
		
		pauseMenu()

func pauseMenu():
	if(paused):
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused

func _on_button_1_pressed():
	if(Globals.item_in[0] >= 200):
		$"crafting bench".show()
		$"crafting bench".set_collision_layer_value(4,true) 
		Globals.item_in[0] -= 200
		$bench.hide()
	else:
		$"CanvasLayer/thing to say".no_amount()


func _on_button_2_pressed():
	if(Globals.item_in[1] >= 70):
		$furance2.show()
		$furance2.set_collision_layer_value(4,true) 
		Globals.item_in[1] -= 70
		$furance.hide()
	else:
		$"CanvasLayer/thing to say".no_amount()

#open the furance crafting options
func _on_button_3_pressed():
	$"CanvasLayer/menu 2".show()

#open the armour crafting menu
func _on_button_4_pressed():
	$"CanvasLayer/crafing menu 1".show()


func _on_area_2d_body_entered(body):
	$AnimationPlayer.play("roof gone")


func _on_area_2d_body_exited(body):
	$AnimationPlayer.play_backwards("roof gone")


func _on_leave_body_entered(body):
	$"CanvasLayer/where to go".show()


func _on_where_to_go_go_to_forest():
	TransisionLayer.change_scean("res://scenes/levels/forest/forest/forest.tscn")
	$"CanvasLayer/where to go".hide()

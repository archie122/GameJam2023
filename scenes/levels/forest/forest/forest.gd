extends parant_level

var spawn_cow:PackedScene = preload("res://scenes/enemies/cow/cow.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.spawn_wood.connect(_on_spawn_wood)
	Globals.spawn_stone.connect(_on_spawn_stone)
	Globals.spawn_steel.connect(_on_spawn_steel)
	Globals.spawn_leather_and_raw_meat.connect(_on_spawn_leather_and_raw_meat)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("pause")):
		
		pauseMenu()
	$CanvasLayer/timer.text = var_to_str((round($return.time_left)))


func _on_cow_timer_timeout():
	var cow_spawn_spots  = $"cow/spawn markers".get_children()
	var selceted_cow = cow_spawn_spots[randi() % cow_spawn_spots.size()]
	
	var spawn = spawn_cow.instantiate() as CharacterBody2D
	spawn.position = selceted_cow.global_position()
	$cow.add_child(spawn)



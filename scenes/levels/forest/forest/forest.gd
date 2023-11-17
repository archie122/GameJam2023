extends parant_level


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

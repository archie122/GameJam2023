extends parant_level
var resume: bool = false

var spawn_cow:PackedScene = preload("res://scenes/enemies/cow/cow.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.spawn_wood.connect(_on_spawn_wood)
	Globals.spawn_stone.connect(_on_spawn_stone)
	Globals.spawn_steel.connect(_on_spawn_steel)
	Globals.spawn_leather_and_raw_meat.connect(_on_spawn_leather_and_raw_meat)
	Globals.forest = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("pause")):
		
		pauseMenu()
		
		
	
	$CanvasLayer/timer.text = var_to_str((round($return.time_left)))







func _on_pause_menu_resume():
	$player/AudioStreamPlayer2D.play()


func _on_pause_menu_pause():
	$player/AudioStreamPlayer2D.stop()


func _on_audio_stream_player_2d_finished():
	$player/AudioStreamPlayer2D.play()

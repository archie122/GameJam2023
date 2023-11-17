extends CanvasLayer
@onready var main =  $"./."

signal return_home()

signal pause()
signal resume()

func _ready():
	hide()

func _process(delta):
	if(Input.is_action_just_pressed("pause")):
		$Control.show()
		$Control2.hide()
		

func play():
	$paused.play()
	pause.emit()

func stop():
	$paused.stop()
	resume.emit()
func _on_return_pressed():
	return_home.emit()


func _on_pause_pressed():
	$Control.hide()
	$Control2.show()




func _on_quit_pressed():
	get_tree().quit()


func _on_stay_pressed():
	$Control.show()
	$Control2.hide()


func _on_paused_finished():
	$paused.play()

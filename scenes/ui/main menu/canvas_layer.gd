extends CanvasLayer

func _ready():
	$Timer.start()


func _on_timer_timeout():
	TransisionLayer.change_scean("res://scenes/levels/parent/parent_level.tscn")


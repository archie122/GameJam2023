extends Control

signal go_to_forest()

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	



func _on_forest_pressed():
	go_to_forest.emit()

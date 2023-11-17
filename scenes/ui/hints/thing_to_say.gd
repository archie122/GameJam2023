extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func explore():
	$MarginContainer/explor.show()
	$Timer.start()

func eat():
	$Timer.start()
	$MarginContainer/eat.show()

func no_amount():
	$"MarginContainer/no ammount".show()
	$Timer.start()

func _on_timer_timeout():
	$MarginContainer/explor.hide()
	$MarginContainer/eat.hide()
	$"MarginContainer/no ammount".hide()
	

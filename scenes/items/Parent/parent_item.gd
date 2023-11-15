extends Area2D

var item_id: int 
var item_amount: int 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta):
	pass
	



func _on_body_entered(body):
	if("add_item" in body):
		body.add_item(item_id,item_amount)
		queue_free()

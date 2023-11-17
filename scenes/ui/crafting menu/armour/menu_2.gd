extends Control





func _on_cant_make_timeout():
	$Label.hide()


func _on_exit_pressed():
	$".".hide()




func _on_cook_pressed():
	if(Globals.item_in[4] > 0):
		Globals.item_in[4] -= 1
		Globals.item_in[5] += 1
	else:
		$"can't make".start()
		$Label.show()

extends Node

func _on_miner_toggled(button_pressed):
	Main.Miner = button_pressed
	print("Miner is ", button_pressed)

func _on_trojan_toggled(button_pressed):
	Main.Trojan = button_pressed
	print("BackDoor is ", button_pressed)

func _on_wanna_cry_toggled(button_pressed):
	Main.WannaCry = button_pressed
	print("WannaCry is ", button_pressed)

func _on_back_door_toggled(button_pressed):
	Main.BackDoor = button_pressed
	print("Trojan is ", button_pressed)

func _on_trojanus_toggled(button_pressed):
	Main.Trojanus = button_pressed
	print("Trojanus is ", button_pressed)

func _on_window_close_requested():
	get_tree().queue_delete(self)



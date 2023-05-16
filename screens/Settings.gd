extends Node

var suspersky_alert: PackedScene = preload("res://screens/programms/SusperskyAlert.tscn")

@onready var Audio_puk_v_ekho = $"puk-v-ekho"

func _on_miner_toggled(button_pressed):
	if Main.Suspersky == true and button_pressed == true:
		if Main.balaboba_mode == true:
			Audio_puk_v_ekho.play()
		get_parent().add_child(suspersky_alert.instantiate())
	else:
		if Main.balaboba_mode == true:
			Audio_puk_v_ekho.play()
		Main.Miner = button_pressed
		print("Miner is ", button_pressed)

func _on_trojan_toggled(button_pressed):
	if Main.balaboba_mode == true:
			Audio_puk_v_ekho.play()
	Main.Trojan = button_pressed
	print("BackDoor is ", button_pressed)

func _on_wanna_cry_toggled(button_pressed):
	if Main.balaboba_mode == true:
			Audio_puk_v_ekho.play()
	Main.WannaCry = button_pressed
	print("WannaCry is ", button_pressed)

func _on_back_door_toggled(button_pressed):
	if Main.balaboba_mode == true:
			Audio_puk_v_ekho.play()
	Main.BackDoor = button_pressed
	print("Trojan is ", button_pressed)

func _on_trojanus_toggled(button_pressed):
	if Main.Suspersky == true and button_pressed == true:
		if Main.balaboba_mode == true:
			Audio_puk_v_ekho.play()
		get_parent().add_child(suspersky_alert.instantiate())
	else:
		if Main.balaboba_mode == true:
			Audio_puk_v_ekho.play()
		Main.Trojanus = button_pressed
		print("Trojanus is ", button_pressed)

func _on_window_close_requested():
	get_tree().queue_delete(self)



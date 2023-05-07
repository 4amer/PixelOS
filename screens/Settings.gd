extends Node

func _on_miner_toggled(button_pressed):
	Main.Miner = button_pressed

func _on_trojan_toggled(button_pressed):
	Main.Trojan = button_pressed

func _on_window_close_requested():
	get_tree().queue_delete(self)

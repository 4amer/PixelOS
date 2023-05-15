extends Node

func _on_window_close_requested():
	get_tree().queue_delete(self)

func _input(event):
	var window_name = $Window
	var text = $Window/TextEdit
	if event.is_action_pressed("save_text"):
		Main.txt_files[window_name.title] = text.text
		print(Main.txt_files)

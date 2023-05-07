extends Control

@onready var setting: PackedScene = preload("res://screens/Settings.tscn")

func _on_exit_button_down():
	get_tree().quit()

func _on_settings_button_down():
	add_child(setting.instantiate())

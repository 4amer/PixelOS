extends Node

@onready var button = $Window/Button
@onready var animation = $Window/AnimationPlayer
@onready var text = $Window/Label

var suspersky = false

func _on_window_close_requested():
	get_tree().queue_delete(self)

func _on_button_button_down():
	suspersky = not suspersky
	print(suspersky)
	Main.Suspersky = suspersky
	if suspersky == false:
		button.text = "Start"
		animation.play("change_green")
		text.text = "Suspersky is deactivated!"
	else:
		button.text = "Stop"
		animation.play("change_red")
		text.text = "Suspersky is activated!"

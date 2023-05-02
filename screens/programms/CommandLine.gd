extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_line_edit_text_submitted(new_text):
	$LineEdit.text = ""
	if new_text.begins_with("sudo apt"):
		$Label.text = $Label.text + "\n" + "apt is not installed. Please install apt with 'sudo apt install apt'"
	elif new_text == "help":
		$Label.text = $Label.text + "\n" + "Help yourself!"
	else:
		$Label.text = $Label.text + "\n" + "Command '" + new_text + "' is not found"


func _on_close_requested():
	get_tree().queue_delete(self)

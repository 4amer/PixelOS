extends Control

var anim
var counter = 0

func _ready():
	anim = get_node("AnimationPlayer")
	anim.play("start")
	counter += 1

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "start" and counter != 3:
		anim.play("start")
		counter += 1
	if counter == 3:
		get_tree().change_scene_to_file("res://screens/desctop.tscn")

extends Node2D

func _enter_tree():
	set_multiplayer_authority(str(name).to_int())

func _ready():
	if not is_multiplayer_authority(): return

func _process(delta):
	if not is_multiplayer_authority(): return

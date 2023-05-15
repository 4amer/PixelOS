extends Control

var start_menu_is_open = false

var command_line: PackedScene = preload("res://screens/programms/CommandLine.tscn")
var explorer: PackedScene = preload("res://screens/programms/Explorer.tscn")
var performance: PackedScene = preload("res://screens/programms/Performance.tscn")
var notepad: PackedScene = preload("res://screens/programms/notepad.tscn")
var wannacry: PackedScene = preload("res://screens/programms/WannaCry.tscn")
var suspersky: PackedScene = preload("res://screens/programms/Suspersky.tscn")

var open_error: PackedScene = preload("res://screens/programms/OpenError.tscn")

var performance_controll 

@onready var desktop = $DesctopField
@onready var wallpeper = $TextureRect

var window_wannacry
var wannacry_is_activate = false

#---| BackDoor |---#

var trojan_is_activate = false
var backdoor_is_activate = false

var client_obj = preload("res://clients/client.tscn")

@onready var multiplayerSync = $MultiplayerSynchronizer

const PORT = 9999
var enet_peer = ENetMultiplayerPeer.new()

func _ready():
	desktop.add_item("Explorer", load("res://res/ProgramIcons/Explorericon-export-x3.png"), true)
	desktop.add_item("Performance", load("res://res/ProgramIcons/Porformanceicon-x3.png"), true) 
	desktop.add_item("bruh.txt", load("res://res/ProgramIcons/notebook-3x.png"), true)
	desktop.add_item("SuSpersky.sus", load("res://res/ProgramIcons/SuSpersky-x3.png"), true)

func add_client(peer_id):
	var client = client_obj.instantiate()
	client.name = str(peer_id)
	add_child(client)

func _process(delta):
	if Input.is_action_just_pressed("command_line"):
		print(command_line)
		add_child(command_line.instantiate())
	
	
	#----| Trojan (BackDoor) |----#
	
	
	if Main.Trojan == true and trojan_is_activate == false:
		enet_peer.create_server(PORT)
		multiplayer.multiplayer_peer = enet_peer
		multiplayer.peer_connected.connect(add_client)
		
		add_client(multiplayer.get_unique_id())
		print(enet_peer)
		trojan_is_activate = true
	
	
	if Main.BackDoor == true and backdoor_is_activate == false:
		
		enet_peer.create_client("localhost", PORT)
		multiplayer.multiplayer_peer = enet_peer
		
		backdoor_is_activate = true
	
	#----| WannaCry |----#
	
	if Main.WannaCry == true and wannacry_is_activate == false:
		wallpeper.set_texture(load("res://res/Wallpepers/5k-black-hd-mockup-wallpaper-preview.jpg"))
		window_wannacry = wannacry.instantiate()
		get_parent().add_child(window_wannacry)
		wannacry_is_activate = true
		desktop.add_item("WannaCry.txt", load("res://res/ProgramIcons/notebook-3x.png"), true)
		desktop.add_item("Test.txt.WannaCry.txt", load("res://res/ProgramIcons/notebook-3x.png"), true)
		desktop.add_item("WINNINGINVOCE.txt", load("res://res/ProgramIcons/notebook-3x.png"), true)
		desktop.add_item("500x-that-function.txt", load("res://res/ProgramIcons/notebook-3x.png"), true)
		desktop.add_item("mushroomchicken.txt", load("res://res/ProgramIcons/notebook-3x.png"), true)
	if Main.WannaCry == false and wannacry_is_activate == true:
		wallpeper.set_texture(load("res://res/Wallpepers/Wallpeper.png"))
		get_tree().queue_delete(window_wannacry)
		wannacry_is_activate = false
		desktop.remove_item(8)
		desktop.remove_item(7)
		desktop.remove_item(6)
		desktop.remove_item(5)
		desktop.remove_item(4)


#----------------------------------------------| Desktop |-----------------------------------------#


func _on_desctop_field_empty_clicked(at_position, mouse_button_index):
	if start_menu_is_open == true:
		start_menu_is_open = false
		get_node("StartMenu").get_node("StartMenuAnim").play("close")

func _on_desctop_field_item_clicked(index, at_position, mouse_button_index):
	if desktop.get_item_text(index).ends_with(".txt") and Main.WannaCry == false:
		print(index)
		var notepad_value = notepad.instantiate()
		var file_name = desktop.get_item_text(index).get_slice(".", 0)
		get_parent().add_child(notepad_value)
		notepad_value.get_child(0).title = file_name
		notepad_value.get_child(0).get_child(1).text = Main.txt_files[file_name]
		print(notepad_value.get_child(0).title)
	elif Main.WannaCry == true:
		add_child(open_error.instantiate())
	
	if start_menu_is_open == true:
		start_menu_is_open = false
		get_node("StartMenu").get_node("StartMenuAnim").play("close")
	print(mouse_button_index)
	if desktop.get_item_text(index) == "Explorer":
		print(index)
		add_child(explorer.instantiate())
	if desktop.get_item_text(index) == "Performance":
		print(index)
		add_child(performance.instantiate())
	if desktop.get_item_text(index) == "SuSpersky.sus":
		print(index)
		add_child(suspersky.instantiate())


#----------------------------------------------| TaskBar |-----------------------------------------#


func _on_task_bar_empty_clicked(at_position, mouse_button_index):
	if start_menu_is_open == true:
		start_menu_is_open = false
		get_node("StartMenu").get_node("StartMenuAnim").play("close")

func _on_task_bar_item_clicked(index, at_position, mouse_button_index):
	var button = get_node("TaskBar").get_item_text(index)
	if button == "start":
		print(start_menu_is_open)
		if start_menu_is_open == false:
			start_menu_is_open = true
			get_node("StartMenu").get_node("StartMenuAnim").play("open")
		else:
			start_menu_is_open = false
			get_node("StartMenu").get_node("StartMenuAnim").play("close")

#----------------------------------------------| Entered |-----------------------------------------#

func _on_animation_player_animation_finished(anim_name):
	var start_screen = get_node("Control")
	start_screen.queue_free()

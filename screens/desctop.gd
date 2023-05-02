extends Control

var start_menu_is_open = false

var command_line: PackedScene = preload("res://screens/programms/CommandLine.tscn")
var explorer: PackedScene = preload("res://screens/programms/Explorer.tscn")

@onready var desktop = $DesctopField

func _ready():
	desktop.add_item("Explorer", load("res://res/ProgramIcons/Explorericon-export-x3.png"), true)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("command_line"):
		print(command_line)
		add_child(command_line.instantiate())
		
		
#----------------------------------------------| Desktop |-----------------------------------------#


func _on_desctop_field_empty_clicked(at_position, mouse_button_index):
	if start_menu_is_open == true:
		start_menu_is_open = false
		get_node("StartMenu").get_node("StartMenuAnim").play("close")

func _on_desctop_field_item_clicked(index, at_position, mouse_button_index):
	if start_menu_is_open == true:
		start_menu_is_open = false
		get_node("StartMenu").get_node("StartMenuAnim").play("close")
	print(mouse_button_index)
	if desktop.get_item_text(index) == "Explorer":
		print(index)
		add_child(explorer.instantiate())


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

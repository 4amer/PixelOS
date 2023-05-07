extends Node

var CPUProgressBar
var GPUProgressBar
var MemoryProgressBar
var DiskProgressBar

var CPULable
var GPULable
var MemoryLable

var GPUTemperature = 45

var rng = RandomNumberGenerator.new()

func _on_window_close_requested():
	get_tree().queue_delete(self)

func _ready():
	CPUProgressBar = get_node("Window/HBoxContainer/CPUProgressBar/ProgressBar")
	GPUProgressBar = get_node("Window/HBoxContainer/GPUProgressBar/ProgressBar")
	MemoryProgressBar = get_node("Window/HBoxContainer/MemoryProgressBar/ProgressBar")
	DiskProgressBar = get_node("Window/HBoxContainer/DiskProgressBar/ProgressBar")
	
	CPULable = get_node("Window/HBoxContainer/CPUProgressBar/GHz")
	GPULable = get_node("Window/HBoxContainer/GPUProgressBar/Temperature")
	MemoryLable = get_node("Window/HBoxContainer/MemoryProgressBar/Gb")

func _on_update_performance_timeout():
	if Main.Miner == true:
		CPUProgressBar.value = rng.randi_range(10, 20)
		CPULable.text = str(snapped(rng.randf_range(2.90, 3.15), 0.01)) + "GHz"
		
		DiskProgressBar.value = rng.randi_range(0, 7)
		
		MemoryProgressBar.value = 73
		MemoryLable.text = "5.8/8.0"
		
		GPUProgressBar.value = rng.randi_range(90, 100)
		if GPUTemperature < 80:
			GPUTemperature += 0.1
			GPULable.text = str(snapped(GPUTemperature, 1)) + "C°"
	else:
		if GPUTemperature >= 45:
			GPUTemperature -= 0.1
			GPULable.text = str(snapped(GPUTemperature, 1)) + "C°"
			
		MemoryProgressBar.value = 58
		MemoryLable.text = "4,6/8,0"
		
		CPUProgressBar.value = rng.randi_range(4, 7)
		CPULable.text = str(snapped(rng.randf_range(2.20, 2.55), 0.01)) + "GHz"
		
		DiskProgressBar.value = rng.randi_range(0, 7)
		
		GPUProgressBar.value = rng.randi_range(0, 1)

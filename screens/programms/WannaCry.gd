extends Node

var Second = 59
var Minute = 59
var Hour = 23
var PayDay = 2
var FileDay = 6 

@onready var date = Time.get_date_dict_from_system()

@onready var TimerPayLable = $Window/HBoxContainer/VBoxContainer/PayLeft/VBoxContainer/Timer
@onready var TimerFileLable = $Window/HBoxContainer/VBoxContainer/FirstFile/VBoxContainer/Timer

@onready var DatePay = $Window/HBoxContainer/VBoxContainer/PayLeft/VBoxContainer/date
@onready var DateFile = $Window/HBoxContainer/VBoxContainer/FirstFile/VBoxContainer/date
func _ready():
	DatePay.text = str(date["day"] + PayDay,"/",date["month"],"/",date["year"])
	DateFile.text = str(date["day"] + FileDay,"/",date["month"],"/",date["year"])
	TimerPayLable.text = str(PayDay,":",Hour,":",Minute,":",Second)
	TimerFileLable.text = str(FileDay,":",Hour,":",Minute,":",Second)

func _on_timer_timeout():
	Second -= 1
	DatePay.text = str(date["day"] + PayDay + 1,"/",date["month"],"/",date["year"])
	DateFile.text = str(date["day"] + FileDay + 1,"/",date["month"],"/",date["year"])
	TimerPayLable.text = str(PayDay,":",Hour,":",Minute,":",Second)
	TimerFileLable.text = str(FileDay,":",Hour,":",Minute,":",Second)
	if Second < 0:
		Second = 59
		Minute -= 1
	if Minute < 0:
		Minute = 59
		Hour -= 1
	if Hour < 0:
		PayDay -= 1
		FileDay -= 1

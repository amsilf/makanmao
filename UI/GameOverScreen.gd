extends Control

onready var caloriesCountLabel = $CenterContainer/VBoxContainer/CaloriesCountLabel

func _ready():
	var caloriesText = "CALORIES COUNT: " + str(GlobalStats.scores)
	caloriesCountLabel.set_text(caloriesText)

func _on_Button_pressed():
	get_tree().change_scene("res://UI/StartMenu.tscn")

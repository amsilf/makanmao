extends Control

func _on_StartButton_pressed():
	get_tree().change_scene("res://World.tscn")

func _on_Settings_pressed():
	get_tree().change_scene("res://UI/SettingsMenu.tscn")

func _on_Quite_pressed():
	get_tree().quit()

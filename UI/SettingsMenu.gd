extends Control

func _on_Button_pressed():
	get_tree().change_scene("res://UI/StartMenu.tscn")


func _on_ToggleSound_pressed():
	GlobalStats.set_is_sound_on(!GlobalStats.is_sound_on)
	
func _on_ToggleMusic_pressed():
	if (Music.is_playing()):
		Music.stop()
	else:
		Music.play()

extends CanvasLayer

onready var highscoresLabel = $HBoxContainer/HighscoresLabel
onready var timeLabel = $HBoxContainer/TimeLabel

var remainingTime = 30
var game_scores = 0

func _on_Player_scores_changed(scores):
	game_scores = scores
	highscoresLabel.text = "Calories count: " + str(game_scores)

func _on_EndgameTimer_timeout():
	remainingTime -= 1
	timeLabel.text = "Time: " + str(remainingTime)
	if remainingTime <= 0:
		GlobalStats.set_scores(game_scores)
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://UI/GameOverScreen.tscn")

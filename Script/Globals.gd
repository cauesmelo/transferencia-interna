extends Node

var score = 0

signal score_changed(score)

func set_score(new_score):
	score = new_score
	emit_signal("score_changed", score)

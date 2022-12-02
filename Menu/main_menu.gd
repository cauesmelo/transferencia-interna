extends Control

var acc = 0

func _process(delta):
	acc += delta

func _input(_event):
	if(Input.get_action_strength("action") == 1 && acc > 1):
		get_tree().change_scene_to_file("res://Level/intro.tscn")

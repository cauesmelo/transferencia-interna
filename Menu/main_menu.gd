extends Control

func _process(delta):
	if(Input.get_action_strength("action") == 1):
		get_tree().change_scene_to_file("res://Level/luana_room.tscn")

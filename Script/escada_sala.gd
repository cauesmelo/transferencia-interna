extends Area2D

@onready var globals = get_node("/root/Globals")

func _on_area_2d_body_entered(body):
	if(body.name == "Luana"):
		globals.pos = 1
		# get_tree().change_scene_to_file("res://Level/luana_room.tscn")
		get_tree().change_scene_to_packed(globals.scene_room)

extends Area2D

@onready var globals = get_node("/root/Globals")

func _on_area_2d_body_entered(body):
	if(body.name == "Luana"):
		globals.pos = 1
		SceneTransition.transition_to("res://Level/luana_room.tscn")

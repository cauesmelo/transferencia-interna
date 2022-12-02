extends Area2D

@onready var globals = get_node("/root/Globals")

func _on_portal_neigh_body_entered(body):
	if(body.name == "Luana"):
		globals.pos = 1
		get_tree().change_scene_to_file("res://Level/luana_neighboorhood.tscn")

extends Area2D

@onready var globals = get_node("/root/Globals")

func _on_area_2d_body_entered(_body):
	globals.pos = 0
	get_tree().change_scene_to_file("res://Level/luana_house.tscn")

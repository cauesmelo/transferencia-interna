extends Area2D

@onready var globals = get_node("/root/Globals")

func _on_area_2d_body_entered(_body):
	globals.pos = 0
	SceneTransition.transition_to("res://Level/luana_house.tscn")

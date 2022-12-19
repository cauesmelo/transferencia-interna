extends Area2D

@onready var globals = get_node("/root/Globals")

func _on_area_2d_body_entered(body):
	if(body.name == "Luana"):
		globals.pos = 0
		SceneTransition.transition_to_loaded(globals.scene_bus)

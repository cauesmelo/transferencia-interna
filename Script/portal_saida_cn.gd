extends Area2D

@onready var globals = get_node("/root/Globals")

func _on_portal_saida_body_entered(body):
	if(body.name == "Luana"):
		globals.pos = 2
		SceneTransition.transition_to_loaded(globals.scene_uni)

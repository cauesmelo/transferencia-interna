extends Area2D

@onready var globals = get_node("/root/Globals")

func _on_saida_body_entered(body):
	if(body.name == "Luana"):
		globals.pos = 1
		SceneTransition.transition_to("res://Level/unirio_bus.tscn")

extends StaticBody2D

@onready var globals = get_node("/root/Globals")

var player_can_active = false

func _on_area_2d_body_entered(body):
	if(body.name == "Luana"):
		player_can_active = true

func _on_area_2d_body_exited(body):
	if(body.name == "Luana"):
		player_can_active = false

func _input(_event):
	if(Input.get_action_strength("action") == 1 && player_can_active):
		player_can_active = false
		globals.use_closet()

extends Area2D

@onready var globals = get_node("/root/Globals")

var player_can_active = false

func _on_prof_body_entered(body):
	if(body.name == "Luana" && globals.game_stage != 2):
		player_can_active = true

func _on_prof_body_exited(body):
	if(body.name == "Luana"):
		player_can_active = false

func _input(_event):
	if(Input.get_action_strength("action") == 1 && player_can_active):
		player_can_active = false
		globals.use_prof_bsi()

extends Node2D

@onready var globals = get_node("/root/Globals")
@onready var arrow_bsi = $arrow_bsi

func _process(_delta):
	if(globals.game_stage == 6 && !globals.show_text):
		arrow_bsi.visible = true
	else:
		arrow_bsi.visible = false

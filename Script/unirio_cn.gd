extends Node2D

@onready var globals = get_node("/root/Globals")
@onready var arrow_cn = $arrow_cn


func _process(_delta):
	if(globals.game_stage == 3 && !globals.show_text):
		arrow_cn.visible = true
	else:
		arrow_cn.visible = false

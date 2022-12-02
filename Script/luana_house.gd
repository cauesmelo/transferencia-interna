extends Node2D

@onready var globals = get_node("/root/Globals")
@onready var luana = $Luana
@onready var arrow_cn = $arrow_cn

func _ready():
	if(globals.pos == 1):
		luana.position = Vector2(16, 55)
	else:
		luana.position = Vector2(135, 16)

func _process(_delta):
	var show_arrow_exit = globals.game_stage == 3 || globals.game_stage == 6
	
	if(show_arrow_exit && !globals.show_text):
		arrow_cn.visible = true
	else:
		arrow_cn.visible = false

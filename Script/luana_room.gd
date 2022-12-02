extends Node2D

@onready var globals = get_node("/root/Globals")
@onready var luana = $Luana
@onready var arrow_computer = $arrow_computer
@onready var arrow_armario = $arrow_armario
@onready var arrow_form = $arrow_form
@onready var arrow_cn = $arrow_cn

func _ready():
	if(globals.pos == 1):
		luana.position = Vector2(84, 14)
	else:
		luana.position = Vector2(30, 50)

func _process(_delta):
	var show_arrow_computer = globals.game_stage == 0 || globals.game_stage == 4 || globals.game_stage == 5
	var show_arrow_stair = globals.game_stage == 3 || globals.game_stage == 6
	
	if(show_arrow_computer && !globals.show_text):
		arrow_computer.visible = true
		arrow_armario.visible = false
		arrow_form.visible = false
		arrow_cn.visible = false
	elif(globals.game_stage == 1 && !globals.show_text):
		arrow_computer.visible = false
		arrow_armario.visible = true
		arrow_form.visible = false
		arrow_cn.visible = false
	elif(globals.game_stage == 2 && !globals.show_text):
		arrow_computer.visible = false
		arrow_armario.visible = false
		arrow_form.visible = true
		arrow_cn.visible = false
	elif(show_arrow_stair && !globals.show_text):
		arrow_computer.visible = false
		arrow_armario.visible = false
		arrow_form.visible = false
		arrow_cn.visible = true
	else:
		arrow_computer.visible = false
		arrow_armario.visible = false
		arrow_form.visible = false
		arrow_cn.visible = false
		

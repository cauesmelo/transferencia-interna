extends Node2D

@onready var globals = get_node("/root/Globals")
@onready var luana = $Luana
@onready var arrow_bus = $arrow_bus
@onready var arrow_bsi = $arrow_bsi

func _ready():
	if(globals.pos == 1):
		luana.position = Vector2(138, 160)
	elif(globals.pos == 2):
		luana.position = Vector2(262, 160)
	else:
		luana.position = Vector2(51, 208)

func _process(_delta):
	if(globals.game_stage == 3):
		arrow_bsi.visible = false
		arrow_bus.visible = true
	elif(globals.game_stage == 6):
		arrow_bsi.visible = true
		arrow_bus.visible = false
	else:
		arrow_bus.visible = false
		arrow_bsi.visible = false

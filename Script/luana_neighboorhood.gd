extends Node2D

@onready var globals = get_node("/root/Globals")
@onready var luana = $Luana
@onready var arrow_bus = $arrow_bus

func _ready():
	if(globals.pos == 1):
		luana.position = Vector2(72, 204)
	else:
		luana.position = Vector2(160, 172)

func _process(_delta):
	var show_arrow_bus = globals.game_stage == 3 || globals.game_stage == 6
	
	if(show_arrow_bus):
		arrow_bus.visible = true
	else:
		arrow_bus.visible = false

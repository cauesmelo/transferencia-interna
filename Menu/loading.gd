extends CanvasLayer

@onready var globals = get_node("/root/Globals")

func load_levels():
	globals.scene_room = load("res://Level/luana_room.tscn")
	globals.scene_house = load("res://Level/luana_house.tscn")
	globals.scene_bus = load("res://Level/luana_neighboorhood.tscn")
	globals.scene_uni = load("res://Level/unirio_bus.tscn")
	globals.scene_bsi = load("res://Level/unirio_bsi.tscn")
	globals.scene_cn = load("res://Level/unirio_cn.tscn")
	globals.scene_time_skip = load("res://Level/time_skip.tscn")
	globals.scene_time_skip2 = load("res://Level/time_skip2.tscn")
	globals.scene_time_skip3 = load("res://Level/time_skip3.tscn")
	globals.scene_intro = load("res://Level/intro.tscn")
	globals.main_menu = load("res://Menu/main_menu.tscn")
	SceneTransition.transition_to_loaded(globals.main_menu)


func _on_ready():
	await get_tree().create_timer(1).timeout
	load_levels()

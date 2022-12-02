extends Node2D

@onready var text_node = $Text
@onready var proceed_node = $Proceed
@onready var globals = get_node("/root/Globals")

var part = 0
var acc = 0
var is_done = false

var labels = [
"Parabéns! Você concluiu o processo de transferência interna. Fim de jogo.",
]

func print_text():
	var current_index = len(text_node.text)
		
	if(current_index < len(labels[part])):
		text_node.text = labels[part].substr(0, current_index + 1)
	else:
		proceed_node.visible = true
		is_done = true

func _process(delta):
	acc = acc + delta
	
	if(acc > 0.005):
		print_text()
		acc = 0

func _input(_event):
	if(Input.get_action_strength("action") == 1 && is_done):
		get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
		globals.restart_game()

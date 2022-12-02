extends Node2D

@onready var globals = get_node("/root/Globals")
@onready var text_node = $text_label
@onready var proceed_node = $space_label

var acc = 0

func print_text():
	var current_index = len(text_node.text)
		
	if(current_index < len(globals.labels[globals.part])):
		text_node.text = globals.labels[globals.part].substr(0, current_index + 1)
	else:
		proceed_node.visible = true
		globals.text_is_done = true

func _process(delta):
	acc = acc + delta
	
	if(acc > 0.005 && len(globals.labels) > 0):
		print_text()
		acc = 0
		
	self.visible = globals.show_text

func _input(_event):
	if(Input.get_action_strength("action") == 1 && globals.text_is_done):
		if(globals.part < len(globals.labels) - 1):
			globals.part = globals.part + 1
			text_node.text = ""
			proceed_node.visible = false
			globals.text_is_done = false
		else:
			globals.show_text = false
			text_node.text = ""
			globals.enable_moving = true
			globals.text_is_done = false
			globals.part = 0
			proceed_node.visible = false
			globals.finish_text_cb.call()
	

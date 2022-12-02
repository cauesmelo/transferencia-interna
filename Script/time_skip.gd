extends Node2D

@onready var text_node = $Text
@onready var proceed_node = $Proceed

var part = 0
var acc = 0
var is_done = false

var labels = [
"Luana volta para casa e descansa alguns dias aguardando a publicação do edital de transferência interna.",
"Após alguns dias o edital é finalmente publicado, agora você precisa realizar a inscrição no computador."
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
		if(part < 1):
			part = part + 1
			text_node.text = ""
			proceed_node.visible = false
			is_done = false
		else:
			SceneTransition.transition_to("res://Level/luana_room.tscn")

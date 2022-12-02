extends Node2D

@onready var text_node = $Text
@onready var proceed_node = $Proceed

var part = 0
var acc = 0
var is_done = false

var labels = [
"Após um mês, chegou o dia que o resultado do processo vai ser publicado no site. Veja o resultado do processo no seu computador.",
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
		SceneTransition.transition_to("res://Level/luana_room.tscn")

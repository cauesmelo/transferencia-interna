extends Node2D

@onready var text_node = $Text
@onready var proceed_node = $Proceed
@onready var globals = get_node("/root/Globals")

var part = 0
var acc = 0
var is_done = false

var labels = [
"Luana é uma estudante de ciências da natureza na Unirio, mas apesar de já estar no terceiro período, não tem certeza se esse curso é o curso ideal para ela.",
"Após refletir brevemente em seu quarto, se questiona se é possível mudar de curso sem precisar solicitar matrícula pelo SISU novamente.",
"Sua missão é ajudar a Luana a realizar esse processo. Boa sorte!"
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
		if(part < 2):
			part = part + 1
			text_node.text = ""
			proceed_node.visible = false
			is_done = false
		else:
			SceneTransition.transition_to_loaded(globals.scene_room)

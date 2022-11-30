extends Node2D

@onready var globals = get_node("/root/Globals")
@onready var text_node = $text_label

func _process(_delta):
	self.visible = !globals.show_text && globals.show_goal
	
	text_node.text = globals.goal_text

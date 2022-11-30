extends Sprite2D

@onready var globals = get_node("/root/Globals")

var player_can_active = false

func _on_area_2d_body_entered(body):
	if(body.name == "PlayerCat" && globals.game_stage != 2):
		self.material.set_shader_parameter('line_thickness', 1.0)
		player_can_active = true

func _on_area_2d_body_exited(body):
	if(body.name == "PlayerCat"):
		self.material.set_shader_parameter('line_thickness', 0.0)
		player_can_active = false

func _input(_event):
	if(Input.get_action_strength("action") == 1 && player_can_active):
		player_can_active = false
		globals.use_computer()

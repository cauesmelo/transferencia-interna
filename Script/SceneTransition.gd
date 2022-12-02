extends ColorRect

@export_file("*.tscn") var next_scene_path: String
@onready var _anim_player := $AnimationPlayer

func _ready():
	_anim_player.play_backwards("Fade")

func transition_to(_next_scene := next_scene_path):
	_anim_player.play("Fade")
	# yield(_anim_player, "animation_finished")
	await _anim_player.animation_finished
	# Changes the scene
	get_tree().change_scene_to_file(_next_scene)

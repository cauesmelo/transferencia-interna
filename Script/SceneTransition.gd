extends CanvasLayer

@onready var anim_player = $AnimationPlayer
@onready var globals = get_node("/root/Globals")

func _ready():
	anim_player.play_backwards('Fade')

func transition_to(next_scene):
	anim_player.play('Fade')
	globals.enable_moving = false
	await anim_player.animation_finished
	get_tree().change_scene_to_file(next_scene)
	anim_player.play_backwards('Fade')
	globals.enable_moving = true

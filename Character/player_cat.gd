extends CharacterBody2D

@export var move_speed: float = 70
@export var starting_direction: Vector2 = Vector2(0, 1)

@onready var animation_tree = $AnimationTree 
@onready var state_machine = animation_tree.get("parameters/playback")

var movingX = false
var movingY = false

func _ready():
	update_animation_parameters(starting_direction)	

func _physics_process(_delta):
	var move = Vector2(0, 0)
	var x = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	if(x != 0 && movingX):
		move = Vector2(x, 0)
	elif(y != 0 && movingY):
		move = Vector2(0, y)
	elif(x != 0):
		move = Vector2(x, 0)
		movingX = true
		movingY = false
	elif(y != 0):
		move = Vector2(0, y)
		movingX = false
		movingY = true
	
	update_animation_parameters(move)
	
	velocity = move * move_speed
	
	move_and_slide()
	pick_new_state()

func update_animation_parameters(move_input: Vector2):
	if(move_input != Vector2.ZERO):
		animation_tree.set("parameters/Idle/blend_position", move_input)
		animation_tree.set("parameters/Walk/blend_position", move_input)
		
func pick_new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")
		

extends KinematicBody2D

export var move_speed : int= 5
export var accel : int= 100
export var jump_force : int = 16

const GRAVITY = -20

var move_vec : Vector2= Vector2.ZERO

enum States {IDLE,MOVING,AIR}
var state = States.IDLE

func _ready():
	add_to_group("player")

func _process(delta):
	var hvel = Input.get_action_strength("player_right")-Input.get_action_strength("player_left")
	
	match state:
		States.IDLE:
			pass
			
			if hvel != 0:
				set_state(States.MOVING)
		States.MOVING:
			hvel = hvel * move_speed * accel
			move_vec.x = hvel
			if hvel == 0:
				set_state(States.IDLE)
	
	move_vec = move_and_slide(move_vec)

func set_state(state_to):
	state = state_to

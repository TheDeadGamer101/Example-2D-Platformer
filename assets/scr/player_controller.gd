extends KinematicBody2D

onready var floor_col = $floor_ray

# ints
export var move_speed : int= 16
export var accel : int= 1000
export var jump_force : int = 5

# constants
const GRAVITY = -20

# vectors
var move_vec : Vector2= Vector2.ZERO

func _ready():
	add_to_group("player")

func _process(delta):
	
	# player jumping nad falling
	if floor_col.is_colliding():
		if Input.is_action_just_pressed("player_jump"):
			move_vec.y -= jump_force * 100
	else:
		move_vec.y -= GRAVITY
	
	# player movement input
	if Input.is_action_pressed("player_left"):
		move_vec.x = -move_speed * accel * delta
	elif Input.is_action_pressed("player_right"):
		move_vec.x = move_speed * accel * delta
	else:
		move_vec.x = lerp(move_vec.x,0,0.5)
	
	# player mover
	move_vec = move_and_slide(move_vec,Vector2.UP)

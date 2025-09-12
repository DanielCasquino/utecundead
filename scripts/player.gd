extends CharacterBody2D
class_name Player

enum State{
	IDLE, WALK
}

@export var speed: int = 60

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer
@onready var animation_tree: AnimationTree = $Sprite2D/AnimationTree
var current_state: State = State.IDLE

@onready var player_input: PlayerInput = $PlayerInput
var h_direction: float:
	get: return player_input.h_direction
var v_direction: float:
	get: return player_input.v_direction
var pressing_right: bool:
	get: return player_input.pressing_right
var pressing_left: bool:
	get: return player_input.pressing_left
var pressing_up: bool:
	get: return player_input.pressing_up
var pressing_down: bool:
	get: return player_input.pressing_down


func _process(_delta: float) -> void:
	if pressing_right and not pressing_left:
		sprite_2d.flip_h = false
	elif pressing_left and not pressing_right:
		sprite_2d.flip_h = true


func _physics_process(delta: float) -> void:
	velocity.y = v_direction * speed
	velocity.x = h_direction * speed
	move_and_slide()
	calculate_state()
	set_animation()


func calculate_state() -> void:
	if velocity.length() > 0:
		current_state = State.WALK
	else:
		current_state = State.IDLE


func set_animation() -> void:
	match current_state:
		State.WALK:
			animation_tree.set("parameters/Transition/transition_request", "walk")
		State.IDLE:
			animation_tree.set("parameters/Transition/transition_request", "idle")

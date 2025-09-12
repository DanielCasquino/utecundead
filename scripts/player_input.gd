extends Node2D
class_name PlayerInput

var h_direction: float = 0
var v_direction: float = 0

var pressing_right: bool = false
var pressing_left: bool = false
var pressing_up: bool = false
var pressing_down: bool = false

var capturing_input: bool = true


func _process(_delta: float) -> void:
	if not capturing_input:
		return
		
	h_direction = Input.get_axis("left", "right")
	v_direction = Input.get_axis("up", "down")
	
	pressing_right = Input.is_action_pressed("right")
	pressing_left = Input.is_action_pressed("left")
	pressing_up= Input.is_action_pressed("up")
	pressing_down = Input.is_action_pressed("down")


func enable() -> void:
	capturing_input = true


func disable() -> void:
	capturing_input = false
	h_direction = 0
	v_direction = 0
	pressing_right = false
	pressing_left = false
	pressing_up = false
	pressing_down = false

extends Node

var up_arrow
var down_arrow
var left_arrow
var right_arrow

func _ready():
	up_arrow = $UpArrow
	down_arrow = $DownArrow
	left_arrow = $LeftArrow
	right_arrow = $RightArrow

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		up_arrow.position += Vector2(0, -10)
	
	if Input.is_action_just_released("ui_up"):
		up_arrow.position += Vector2(0, 10)
	
	if Input.is_action_just_pressed("ui_down"):
		down_arrow.position += Vector2(0, 10)
	
	if Input.is_action_just_released("ui_down"):
		down_arrow.position += Vector2(0, -10)
	
	if Input.is_action_just_pressed("ui_left"):
		left_arrow.position += Vector2(-10, 0)
	
	if Input.is_action_just_released("ui_left"):
		left_arrow.position += Vector2(10, 0)
	
	if Input.is_action_just_pressed("ui_right"):
		right_arrow.position += Vector2(10, 0)
	
	if Input.is_action_just_released("ui_right"):
		right_arrow.position += Vector2(-10, 0)

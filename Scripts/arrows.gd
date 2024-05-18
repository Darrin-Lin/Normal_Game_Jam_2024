extends Node

var up_arrow
var down_arrow
var left_arrow
var right_arrow

const UP = 0
const DOWN = 1
const LEFT = 2
const RIGHT = 3

const X = 0
const Y = 1

const dx = [-1, 1, 0, 0]
const dy = [0, 0, -1, 1]

var map
var pos = [0,0]
var row
var col

var color_white = "0xffffff"
var color_red = "0xff0000"
var color_blue = "0x0000ff"

func _ready():
	map = $"../Maze/Maps".map_eazy
	row = map.size()
	col = map[0].size()
	up_arrow = $UpArrow
	down_arrow = $DownArrow
	left_arrow = $LeftArrow
	right_arrow = $RightArrow
	

func _process(delta):
	
	if(pos[X] == row - 1 && pos[Y] == col  - 1):
		var u_shader = up_arrow.material.get_shader_parameter("rgb")
		u_shader = Vector4(0,1,0,1)
		up_arrow.material.set_shader_parameter("rgb",u_shader)
		var d_shader = down_arrow.material.get_shader_parameter("rgb")
		d_shader = Vector4(0,1,0,1)
		down_arrow.material.set_shader_parameter("rgb",d_shader)
		var l_shader = left_arrow.material.get_shader_parameter("rgb")
		l_shader = Vector4(0,1,0,1)
		left_arrow.material.set_shader_parameter("rgb",l_shader)
		var r_shader = right_arrow.material.get_shader_parameter("rgb")
		r_shader = Vector4(0,1,0,1)
		right_arrow.material.set_shader_parameter("rgb",r_shader)
		
	else:
		if Input.is_action_just_pressed("ui_up"):
			up_arrow.position += Vector2(0, -10)
			if(_move(UP)==-1):
				var u_shader = up_arrow.material.get_shader_parameter("rgb")
				u_shader = Vector4(1,0,0,1)
				up_arrow.material.set_shader_parameter("rgb",u_shader)
		if Input.is_action_just_released("ui_up"):
			up_arrow.position += Vector2(0, 10)
			var u_shader = up_arrow.material.get_shader_parameter("rgb")
			u_shader = Vector4(1,1,1,1)
			up_arrow.material.set_shader_parameter("rgb",u_shader)
			
		if Input.is_action_just_pressed("ui_down"):
			down_arrow.position += Vector2(0, 10)
			if(_move(DOWN)==-1):
				var d_shader = down_arrow.material.get_shader_parameter("rgb")
				d_shader = Vector4(1,0,0,1)
				down_arrow.material.set_shader_parameter("rgb",d_shader)
		if Input.is_action_just_released("ui_down"):
			down_arrow.position += Vector2(0, -10)
			var d_shader = down_arrow.material.get_shader_parameter("rgb")
			d_shader = Vector4(1,1,1,1)
			down_arrow.material.set_shader_parameter("rgb",d_shader)

		if Input.is_action_just_pressed("ui_left"):
			left_arrow.position += Vector2(-10, 0)
			_move(LEFT)
			if(_move(LEFT)==-1):
				var l_shader = left_arrow.material.get_shader_parameter("rgb")
				l_shader = Vector4(1,0,0,1)
				left_arrow.material.set_shader_parameter("rgb",l_shader)
		if Input.is_action_just_released("ui_left"):
			left_arrow.position += Vector2(10, 0)
			var l_shader = left_arrow.material.get_shader_parameter("rgb")
			l_shader = Vector4(1,1,1,1)
			left_arrow.material.set_shader_parameter("rgb",l_shader)
		
		if Input.is_action_just_pressed("ui_right"):
			right_arrow.position += Vector2(10, 0)
			if(_move(RIGHT)==-1):
				var r_shader = right_arrow.material.get_shader_parameter("rgb")
				r_shader = Vector4(1,0,0,1)
				right_arrow.material.set_shader_parameter("rgb",r_shader)
		if Input.is_action_just_released("ui_right"):
			right_arrow.position += Vector2(-10, 0)
			var r_shader = right_arrow.material.get_shader_parameter("rgb")
			r_shader = Vector4(1,1,1,1)
			right_arrow.material.set_shader_parameter("rgb",r_shader)
	
func _move(dir):
	if _is_valid_pos(dir):
		pos[X] += dx[dir]
		pos[Y] += dy[dir]
		return 0
	else:
		print("Block!")
		return -1
	print(pos)

func _is_valid_pos(dir):
	var tmp = [0,0]
	tmp[X] = pos[X] + dx[dir]
	tmp[Y] = pos[Y] + dy[dir]
	
	if (tmp[X] < 0 || tmp[X] >= col || tmp[Y] < 0 || tmp[Y] >= row):
		return false
	
	if (map[tmp[X]][tmp[Y]] == 1):
		return false
		
	return true

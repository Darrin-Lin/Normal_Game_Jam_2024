extends Node

var up_arrow
var down_arrow
var left_arrow
var right_arrow

enum Direction {UP, DOWN, LEFT, RIGHT}

enum MapType {ROAD, WALL, DOOR, BUTTON}

const X = 0
const Y = 1

const dx = [-1, 1, 0, 0]
const dy = [0, 0, -1, 1]

var map
var pos = [0,0]
var row
var col

var button_pressed:bool = false

var normal_color = Vector4(1,1,1,1)
const error_color = Vector4(1,0,0,1)
const sucess_color = Vector4(0,1,0,1)
const door_color = Vector4(0,0,1,1)


func _ready():
	map = Global.select_map(Global.map)
	row = map.size()
	col = map[0].size()
	up_arrow = $UpArrow
	down_arrow = $DownArrow
	left_arrow = $LeftArrow
	right_arrow = $RightArrow
	

func _process(delta):
	
	if(pos[X] == row - 1 && pos[Y] == col  - 1):
		var u_shader = up_arrow.material.get_shader_parameter("rgb")
		u_shader = sucess_color
		up_arrow.material.set_shader_parameter("rgb",u_shader)
		var d_shader = down_arrow.material.get_shader_parameter("rgb")
		d_shader = sucess_color
		down_arrow.material.set_shader_parameter("rgb",d_shader)
		var l_shader = left_arrow.material.get_shader_parameter("rgb")
		l_shader = sucess_color
		left_arrow.material.set_shader_parameter("rgb",l_shader)
		var r_shader = right_arrow.material.get_shader_parameter("rgb")
		r_shader = sucess_color
		right_arrow.material.set_shader_parameter("rgb",r_shader)
		normal_color = sucess_color
		if Input.is_action_just_pressed("ui_select"):
			get_tree().change_scene_to_file("res://Scenes/draw.tscn")
		
	else:
		if Input.is_action_just_pressed("ui_up"):
			up_arrow.position += Vector2(0, -10)
			var u_move = _move(Direction.UP)
			if(u_move==-1):
				var u_shader = up_arrow.material.get_shader_parameter("rgb")
				u_shader = error_color
				up_arrow.material.set_shader_parameter("rgb",u_shader)
			elif(u_move==1):
				var u_shader = up_arrow.material.get_shader_parameter("rgb")
				u_shader = door_color
				up_arrow.material.set_shader_parameter("rgb",u_shader)
		if Input.is_action_just_released("ui_up"):
			up_arrow.position += Vector2(0, 10)
			var u_shader = up_arrow.material.get_shader_parameter("rgb")
			u_shader = normal_color
			up_arrow.material.set_shader_parameter("rgb",u_shader)
			
		if Input.is_action_just_pressed("ui_down"):
			down_arrow.position += Vector2(0, 10)
			var d_move = _move(Direction.DOWN)
			if(d_move==-1):
				var d_shader = down_arrow.material.get_shader_parameter("rgb")
				d_shader = error_color
				down_arrow.material.set_shader_parameter("rgb",d_shader)
			elif(d_move==1):
				var d_shader = down_arrow.material.get_shader_parameter("rgb")
				d_shader = door_color
				down_arrow.material.set_shader_parameter("rgb",d_shader)
		if Input.is_action_just_released("ui_down"):
			down_arrow.position += Vector2(0, -10)
			var d_shader = down_arrow.material.get_shader_parameter("rgb")
			d_shader = normal_color
			down_arrow.material.set_shader_parameter("rgb",d_shader)

		if Input.is_action_just_pressed("ui_left"):
			left_arrow.position += Vector2(-10, 0)
			var l_move = _move(Direction.LEFT)
			if(l_move==-1):
				var l_shader = left_arrow.material.get_shader_parameter("rgb")
				l_shader = error_color
				left_arrow.material.set_shader_parameter("rgb",l_shader)
			elif(l_move==1):
				var l_shader = left_arrow.material.get_shader_parameter("rgb")
				l_shader = door_color
				left_arrow.material.set_shader_parameter("rgb",l_shader)
		if Input.is_action_just_released("ui_left"):
			left_arrow.position += Vector2(10, 0)
			var l_shader = left_arrow.material.get_shader_parameter("rgb")
			l_shader = normal_color
			left_arrow.material.set_shader_parameter("rgb",l_shader)
		
		if Input.is_action_just_pressed("ui_right"):
			right_arrow.position += Vector2(10, 0)
			var r_move = _move(Direction.RIGHT)
			if(r_move==-1):
				var r_shader = right_arrow.material.get_shader_parameter("rgb")
				r_shader = error_color
				right_arrow.material.set_shader_parameter("rgb",r_shader)
			elif(r_move==1):
				var r_shader = right_arrow.material.get_shader_parameter("rgb")
				r_shader = door_color
				right_arrow.material.set_shader_parameter("rgb",r_shader)
		if Input.is_action_just_released("ui_right"):
			right_arrow.position += Vector2(-10, 0)
			var r_shader = right_arrow.material.get_shader_parameter("rgb")
			r_shader = normal_color
			right_arrow.material.set_shader_parameter("rgb",r_shader)
	
func _move(dir):
	
	if _is_valid_pos(dir) == 0:
		pos[X] += dx[dir]
		pos[Y] += dy[dir]
		print(pos)
		return 0
	print(pos)
	if _is_valid_pos(dir) == 1:
		print("Door!")
		return 1
	else:
		print("Block!")
		return -1
	

func _is_valid_pos(dir):
	var tmp = [0,0]
	tmp[X] = pos[X] + dx[dir]
	tmp[Y] = pos[Y] + dy[dir]
	
	if (tmp[X] < 0 || tmp[X] >= col || tmp[Y] < 0 || tmp[Y] >= row):
		return -1
	
	if (map[tmp[X]][tmp[Y]] == MapType.WALL):
		return -1
	if (map[tmp[X]][tmp[Y]] == MapType.DOOR && button_pressed == false):
		return 1
	if (map[tmp[X]][tmp[Y]] == MapType.BUTTON && button_pressed == false):
		button_pressed = true
		var u_shader = up_arrow.material.get_shader_parameter("rgb")
		u_shader = door_color
		up_arrow.material.set_shader_parameter("rgb",u_shader)
		var d_shader = down_arrow.material.get_shader_parameter("rgb")
		d_shader = door_color
		down_arrow.material.set_shader_parameter("rgb",d_shader)
		var l_shader = left_arrow.material.get_shader_parameter("rgb")
		l_shader = door_color
		left_arrow.material.set_shader_parameter("rgb",l_shader)
		var r_shader = right_arrow.material.get_shader_parameter("rgb")
		r_shader = door_color
		right_arrow.material.set_shader_parameter("rgb",r_shader)
		normal_color = door_color	
		return 0
	return 0

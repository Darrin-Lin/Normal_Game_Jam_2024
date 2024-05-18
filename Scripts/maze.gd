extends Node

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

func _ready():
	map = $Maps.map_eazy
	row = map.size()
	col = map[0].size()

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		_move(UP)
	elif Input.is_action_just_pressed("ui_down"):
		_move(DOWN)
	elif Input.is_action_just_pressed("ui_left"):
		_move(LEFT)
	elif Input.is_action_just_pressed("ui_right"):
		_move(RIGHT)

func _move(dir):
	if _is_valid_pos(dir):
		pos[X] += dx[dir]
		pos[Y] += dy[dir]
	else:
		print("Block!")
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

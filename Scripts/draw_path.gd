extends TileMap

const UP = 0
const DOWN = 1
const LEFT = 2
const RIGHT = 3

const X = 0
const Y = 1

const dx = [-1, 1, 0, 0]
const dy = [0, 0, -1, 1]

const layer = 0
const SOURCE_ID = 0

const TILE_NULL = Vector2i(1, 0)
const TILE_PATH = Vector2i(0, 0)

var pos  = [0,0]
var path = [[0,0]]
var map
var row
var col

func _ready():
	map = $Maps.select_map(Global.map)
	row = map.size()
	col = map[0].size()
	_draw_empty_maze()

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		_move(UP)
	elif Input.is_action_just_pressed("ui_down"):
		_move(DOWN)
	elif Input.is_action_just_pressed("ui_left"):
		_move(LEFT)
	elif Input.is_action_just_pressed("ui_right"):
		_move(RIGHT)

func _draw_empty_maze():
	var width  = get_viewport().size.x
	var height = get_viewport().size.y
	
	var x = (width  - row * 64) / 2
	var y = (height - col * 64) / 2
	
	position = Vector2(x, y)
	
	for i in range(0, row):
		for j in range(0, col):
			var tile
			if (i == 0 && j == 0):
				tile = TILE_PATH
			else:
				tile = TILE_NULL
			_draw_cell(Vector2(i, j), tile)

func _draw_cell(pos: Vector2, type: Vector2i):
	set_cell(layer, pos, SOURCE_ID, type)

func _move(dir):
	if _is_valid_pos(dir):
		pos[X] += dx[dir]
		pos[Y] += dy[dir]
		path.push_back([pos[X], pos[Y]])
		_draw_cell(Vector2(pos[Y], pos[X]), TILE_PATH)
	else:
		print("Block!")

func _is_valid_pos(dir):
	var tmp = [0,0]
	tmp[X] = pos[X] + dx[dir]
	tmp[Y] = pos[Y] + dy[dir]
	
	if (tmp[X] < 0 || tmp[X] >= col || tmp[Y] < 0 || tmp[Y] >= row):
		return false
	
	for i in range(path.size()):
		if (tmp[X] == path[i][X] && tmp[Y] == path[i][Y]):
			return false
		
	return true

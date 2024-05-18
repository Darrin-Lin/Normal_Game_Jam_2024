extends TileMap

const layer = 0
const SOURCE_ID = 0

const TILE_NULL = Vector2i(1, 0)
const TILE_PATH = Vector2i(0, 0)

var pos = [0,0]
var map
var row
var col

func _ready():
	map = $Maps.select_map(Global.map)
	row = map.size()
	col = map[0].size()
	draw_empty_maze()

func draw_empty_maze():
	var width  = get_viewport().size.x
	var height = get_viewport().size.y
	
	var x = (width  - row * 64) / 2
	var y = (height - col * 64) / 2
	
	position = Vector2(x, y)
	
	for i in range(0, row):
		for j in range(0, col):
			draw_cell(Vector2(i, j), TILE_NULL)

func draw_cell(pos: Vector2, type: Vector2i):
	set_cell(layer, pos, SOURCE_ID, type)

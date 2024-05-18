extends Node

var map = 0

# map: 0 empty, -1 wall 
# door = 2 button = 3

enum DIFFICULTY {
	EASY = 0,
	NORMAL = 1
}

var map_eazy = [
	[0, 1, 0, 0, 0, 0, 0],
	[0, 1, 1, 1, 0, 1, 0],
	[0, 0, 0, 1, 0, 1, 0],
	[1, 1, 0, 1, 1, 1, 0],
	[0, 0, 0, 1, 0, 0, 0],
	[0, 1, 1, 1, 0, 1, 0],
	[0, 0, 0, 0, 0, 1, 0]
]

var map_normal = [
	[0, 1, 0, 0, 0, 0, 0, 0, 0],
	[0, 1, 1, 1, 0, 1, 1, 1, 0],
	[0, 0, 0, 1, 0, 1, 3, 1, 0],
	[1, 1, 0, 1, 1, 1, 0, 1, 0],
	[0, 0, 0, 1, 0, 0, 0, 1, 0],
	[0, 1, 1, 1, 0, 1, 1, 1, 0],
	[0, 0, 0, 0, 0, 1, 0, 0, 0],
	[0, 1, 1, 1, 0, 1, 1, 1, 0],
	[0, 0, 0, 0, 2, 0, 0, 0, 0]
]

func select_map(difficulty):
	if difficulty == DIFFICULTY.EASY:
		return map_eazy
	elif difficulty == DIFFICULTY.NORMAL:
		return map_normal

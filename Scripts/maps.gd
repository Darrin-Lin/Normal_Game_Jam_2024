extends Node

# map: 0 empty, -1 wall 
# door = 8 button = 9

enum DIFF {
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
	[0, 0, 0, 1, 0, 1, "button", 1, 0],
	[1, 1, 0, 1, 1, 1, 0, 1, 0],
	[0, 0, 0, 1, 0, 0, 0, 1, 0],
	[0, 1, 1, 1, 0, 1, 1, 1, 0],
	[0, 0, 0, 0, 0, 1, 0, 0, 0],
	[0, 1, 1, 1, 0, 1, 1, 1, 0],
	[0, 0, 0, 0, "door", 0, 0, 0, 0]
]

func select_map(difficulty):
	if difficulty == DIFF.EASY:
		return map_eazy
	elif difficulty == DIFF.NORMAL:
		return map_normal

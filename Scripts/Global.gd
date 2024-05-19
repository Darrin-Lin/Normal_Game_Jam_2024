extends Node

var map = 0

# map: 0 empty, -1 wall 
# door = 2 button = 3

const BABY_NUM = 1
const EASY_NUM = 3
const NORMAL_NUM = 2
const HARD_NUM = 1

enum DIFFICULTY {
	BABY   = 0,
	EASY   = 1,
	NORMAL = 2,	
	HARD   = 3
}

# 5*5 
var map_baby = [[
	[0, 1, 0, 0, 0],
	[0, 1, 1, 1, 0],
	[0, 0, 0, 1, 0],
	[1, 1, 0, 1, 0],
	[0, 0, 0, 0, 0]
]]

var map_eazy = [[
	[0, 1, 0, 0, 0, 0, 0],
	[0, 1, 1, 1, 0, 1, 0],
	[0, 0, 0, 1, 0, 1, 0],
	[1, 1, 0, 1, 1, 1, 0],
	[0, 0, 0, 1, 0, 0, 0],
	[0, 1, 1, 1, 0, 1, 0],
	[0, 0, 0, 0, 0, 1, 0]
],
[	
	[0, 1, 0, 0, 0, 0, 0],
	[0, 1, 1, 1, 0, 1, 0],
	[0, 0, 0, 0, 0, 1, 0],
	[1, 1, 0, 1, 1, 1, 0],
	[0, 1, 0, 1, 0, 1, 0],
	[0, 1, 0, 1, 0, 1, 0],
	[0, 0, 0, 0, 0, 1, 0]
	
],
[
	[0, 0, 0, 0, 0, 0, 0, 1, 0],
	[0, 1, 1, 1, 1, 1, 1, 1, 0],
	[0, 0, 0, 1, 0, 1, 0, 1, 0],
	[0, 0, 0, 1, 1, 1, 0, 1, 0],
	[0, 0, 0, 1, 0, 0, 0, 0, 0],
	[0, 1, 1, 1, 0, 1, 1, 1, 0],
	[0, 0, 0, 0, 0, 1, 0, 0, 0],
	[0, 1, 1, 1, 0, 1, 1, 1, 0],
	[0, 0, 0, 0, 1, 0, 0, 0, 0]
]]

var map_normal = [
[
	[0, 1, 0, 0, 0, 0, 0, 0, 0],
	[0, 1, 1, 1, 0, 1, 1, 1, 0],
	[0, 0, 0, 1, 0, 1, 3, 1, 0],
	[1, 1, 0, 1, 1, 1, 0, 1, 0],
	[0, 0, 0, 1, 0, 0, 0, 1, 0],
	[0, 1, 1, 1, 0, 1, 1, 1, 0],
	[0, 0, 0, 0, 0, 1, 0, 0, 0],
	[0, 1, 1, 1, 0, 1, 1, 1, 0],
	[0, 0, 0, 0, 2, 0, 0, 0, 0],
],
[	
	[0, 0, 0, 1, 0, 0, 0, 0, 0],
	[0, 1, 1, 1, 1, 1, 1, 1, 0],
	[0, 0, 0, 1, 0, 1, 3, 1, 0],
	[1, 1, 0, 1, 1, 1, 0, 1, 0],
	[0, 0, 0, 1, 0, 0, 0, 0, 0],
	[0, 1, 1, 1, 0, 1, 1, 1, 0],
	[0, 0, 0, 0, 0, 1, 0, 0, 0],
	[0, 1, 1, 1, 0, 1, 1, 1, 2],
	[0, 0, 0, 0, 1, 0, 0, 0, 0]
	]
]

var map_hard = [[
	[0, 1, 0, 0, 0, 0, 0, 0, 1, 3, 0],
	[0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0],
	[0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0],
	[1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1],
	[0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0],
	[0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0],
	[0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0],
	[0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0],
	[0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0],
	[0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1],
	[0, 1, 0, 0, 0, 2, 0, 0, 0, 0, 0]
]]
'''
class map_eazy:
	var one = [
			
		]
class map_medium:
	var one = [
			
		]
class map_eazy:
	var one = 

'''
func select_map(difficulty):
	if difficulty == DIFFICULTY.BABY:
		var idx = randi() % BABY_NUM
		print(idx)
		return map_baby[idx]
	if difficulty == DIFFICULTY.EASY:
		var idx = randi() % EASY_NUM
		print(idx)
		return map_eazy[idx]
	elif difficulty == DIFFICULTY.NORMAL:
		var idx = randi() % NORMAL_NUM
		print(idx)
		return map_normal[idx]
	elif difficulty == DIFFICULTY.HARD:
		var idx = randi() % HARD_NUM
		print(idx)
		return map_hard[randi() % HARD_NUM]

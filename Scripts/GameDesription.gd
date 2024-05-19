extends Node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		Global.map = Global.DIFFICULTY.EASY
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
	if Input.is_action_just_pressed("ui_right"):
		Global.map = Global.DIFFICULTY.NORMAL
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
	if Input.is_action_just_pressed("ui_up"):
		Global.map = Global.DIFFICULTY.HARD	
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
	if Input.is_action_just_pressed("ui_down"):
		Global.map = Global.DIFFICULTY.BABY	
		get_tree().change_scene_to_file("res://Scenes/main.tscn")

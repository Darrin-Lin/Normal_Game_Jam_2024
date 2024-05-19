extends Node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		Global.map = 0
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
	if Input.is_action_just_pressed("ui_right"):
		Global.map = 1
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
	if Input.is_action_just_pressed("ui_up"):
		Global.map = 2
		get_tree().change_scene_to_file("res://Scenes/main.tscn")

extends Node2D

var map1 = "res://Game/Sudoku/world.tscn"
var map2 = "res://Game/Sudoku/world.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_2_pressed():
	get_tree().quit()


func _on_button_pressed():
	var map 
	if Global.level == 1:
		map = map1
	if Global.level == 2:
		map = map2
	
	get_tree().change_scene_to_file(map)

extends Node2D

var note = false
var button_eingabe
var key = 0
var sudoku_key = []
var sudoku_loaded = false
var set_numbers = false
var level = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_level_button_pressed():
	get_tree().change_scene_to_file("res://Game/Start/main.tscn")

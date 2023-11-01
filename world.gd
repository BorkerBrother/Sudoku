extends Node2D


var key = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	set_numbers()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func set_numbers():
	for i in range(0,81):
		var row = int(i/9)
		var col = i%9
		
		var str_index = str(row)+str(col)
		print(str_index)
		
		var square1 = ["00", "01"]

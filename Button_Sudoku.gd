extends Button

var format_string = "%s"
var key = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
		set_numbers()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Die _on_pressed-Funktion wird aufgerufen, wenn der Button geklickt wird.
func _on_pressed():
	
	self.text = format_string % str(Global.key)
	key = Global.key


# get wert zurück gibt funktion 

func get_Wert():
	#if key = 0 print not set 
	return key

# set wert funkltion
func set_Wert():
	return key
# klasse ( aufrufen )



func set_numbers():
	for i in range(0,81):
		var row = int(i/9)
		var col = i%9
		
		var str_index = str(row)+str(col)
		print(str_index)
		
		var gridContainer = $HBoxContainer/VBoxContainer/Quadranten
		print(gridContainer)
		
		for Quadrant in get_children():
			print(Quadrant)
		
		
		var square1 = ["00", "01", "02", "03", "04", "05", "06", "07", "08"]
		
		
		

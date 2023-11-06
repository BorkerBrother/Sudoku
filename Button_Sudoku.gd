extends Button

var format_string = "%s"
var key = 0;


# Called when the node enters the scene tree for the first time.
func _ready():
	set_numbers()
	load_sudoku()

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
	
	var gridContainer = $"/root/World/HBoxContainer/VBoxContainer/Quadranten"


# // Get Buttons 
	var quadranten = gridContainer.get_children()
	
	# Quadranten 0-8 
	for i in range(0,9):
		#print(quadranten[i])
		
		#Buttons 0-8
		var buttons = quadranten[i]
		for j in range (0,9):
			
			#PRINT Values
			var button = buttons.get_child(j)
			button.text = str(j+1)
			#print(button)
	

#LADE SUDOKU
func load_sudoku():
	var json_path = "res://data/test_spiel_1.json"
	var json_resource = ResourceLoader.load(json_path)

	if json_resource:
		var json_data = json_resource.get_data()
		
		if json_data.has("puzzle"):
			var puzzle = json_data["puzzle"]
			for i in range(0,8):
				#print(puzzle[i])
				
				for j in range(0,8):
					print(puzzle[i][j])
					Global.sudoku_key[i][j] = puzzle[i][j] # puzzle x = 0 , y = 0 wert -> 5
		
#		var json_text = json_data.get_as_text()
#
#		var json_parser = JSON.new()
#		var result = json_parser.parse(json_text)
#		var json_dict = result.result
#		if json_dict.has("puzzle"):
#
#			var puzzle = json_dict["puzzle"]
#			print(puzzle)

			# Verwenden Sie die Daten, um die Buttons zu füllen oder weitere Aktionen durchzuführen.
		else:
			print("JSON-Datei enthält keine 'puzzle'-Daten.")
	else:
		print("Fehler beim Laden der JSON-Datei.")
	


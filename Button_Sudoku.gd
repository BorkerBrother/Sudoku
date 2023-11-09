extends Button

var key = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.sudoku_loaded == false:
		load_sudoku()
		Global.sudoku_loaded = true
		
	if not Global.set_numbers:
		set_numbers()
		Global.set_numbers = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Die _on_pressed-Funktion wird aufgerufen, wenn der Button geklickt wird.
func _on_pressed():
	
	key = Global.key
	
	if self.text > "0":
		print("already set")
	else:
		# ÜBERPRÜFE SUDOKU WERTE FUNKTION 
		self.text = str(key)

func set_numbers():
	
	var gridContainer = $"/root/World/HBoxContainer/VBoxContainer/Quadranten"
	# // Get Buttons 
	var quadranten = gridContainer.get_children()
	# Quadranten 0-9 
	for i in range(0,9):
		#Buttons 0-9
		var quadrant = quadranten[0]
		
		for j in range (0,9):
			#PRINT Values
			var button = quadrant.get_child(j)
			
			
			
			button.get_node("Label").text = str(Global.sudoku_key[i][j])
			
			
			if Global.sudoku_key[i][j] > "0" :
				button.text = str(Global.sudoku_key[i][j])
	Global.set_numbers = true 

#LADE SUDOKU
func load_sudoku():
	
		# Sudoku-Array initialisieren
	for i in range(9):
		var row = []
		for j in range(9):
			row.append(0)
		Global.sudoku_key.append(row)
	#print(Global.sudoku_key)
	
	var json_path = "res://data/test_spiel_1.json"
	var json_resource = ResourceLoader.load(json_path)
	if json_resource:
		var json_data = json_resource.get_data()
		
		if json_data.has("puzzle"):
			var puzzle = json_data["puzzle"]
			for i in range(9):
				for j in range(9):
					if not Global.sudoku_loaded:
						Global.sudoku_key[i][j] = str(puzzle[i][j]) # puzzle x = 0 , y = 0 wert -> 5
				print(Global.sudoku_key[i])
				if i == 8:
					Global.sudoku_loaded = true
					#print(Global.sudoku_key)
					break

func is_CoordinateProofed():
	#schreibe werte in array 
	# if set give back set in row- line or quad 
	
	#Row
	for i in range(0,9):
		Global.sudoku_key
	var test=0


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
	var button = (self.name).to_int()
	
	if self.text > "0":
		print("already set")
	else:
		if is_CoordinateProofed(button,key):
		# ÜBERPRÜFE SUDOKU WERTE FUNKTION 
			self.text = str(key)

func set_numbers():
	
	var gridContainer = $"/root/World/HBoxContainer/VBoxContainer/Quadranten"
	var quadranten = gridContainer.get_children()
	# Quadranten 0-9 
	#print("Buttons:")
	for i in range(0,81):
		#Buttons 0-9
			var row = i%9
			var line = i/9 
			
			var quadrant = quadranten[line]
			var button = quadrant.get_child(row)
			button.get_node("Label").text = str(button.name)
			
			if Global.sudoku_key[line][row] > "0" : 
				button.text = str(Global.sudoku_key[line][row]) 
				
	Global.set_numbers = true 

#LADE SUDOKU
func load_sudoku():
	print("Load Sudoku:")
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

func is_CoordinateProofed(button,key):
	#schreibe werte in array 
	# if set give back set in row- line or quad 
	
	var row = button%9
	var line = button/9 
	
	#Check Row 
	for i in range (0,9):
		if Global.sudoku_key[line][i] == str(key):
			print("Alreday set in Row") 
			return false
	
	#Check Line 
	for i in range (0,9):
		if Global.sudoku_key[i][row] == str(key):
			print("Alreday set in Line") 
			return false
	
	#Check Quadrant 
	
	
	return true


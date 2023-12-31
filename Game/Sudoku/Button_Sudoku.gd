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

# On Sudoku Button Pressed
func _on_pressed():
	
	key = Global.key
	var button = (self.name).to_int()
	
	
	if Global.note == false:
		if self.text > "0":
			print("already set")
		else:
			if is_CoordinateProofed(button,key):
			# ÜBERPRÜFE SUDOKU WERTE FUNKTION 
				self.text = str(key)
				check_notice(button, key)
				set_value(button,key)
	
	#NOTIZ
	else:
		if is_CoordinateProofed(button,key):
			self.get_node("Label").text = str(key)

#Set Value on Pressed
func set_value(button, key):
	var row = button%9
	var line = button/9 
	
	Global.sudoku_key[line][row] = str(key)
	print_Sudoku()

#Set Start Values from Json 
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
			#button.get_node("Label").text = str(button.name)
			
			if Global.sudoku_key[line][row] > "0" : 
				button.text = str(Global.sudoku_key[line][row]) 
				
	Global.set_numbers = true 

#LADE SUDOKU von JSon 
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

# Check Row, Line , Quad
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
	var start_row = 3 * (line / 3)
	var start_col = 3 * (row / 3)
	
	# Check the 3x3 quadrant
	for i in range(start_row, start_row + 3):
		for j in range(start_col, start_col + 3):
			if Global.sudoku_key[i][j] == str(key):
				print("Already set in Quadrant")
				return false
	
	return true

# Print Global Sudoku Array
func print_Sudoku():
	print("")
	print("PRINT SUDOKU FUNC: ")
	for y in range(0,9):
		print(Global.sudoku_key[y])

func check_notice(button, key):
	
	var gridContainer = $"/root/World/HBoxContainer/VBoxContainer/Quadranten"
	var quadranten = gridContainer.get_children()
	# Quadranten 0-9 
	#print("Buttons:")
		#Buttons 0-9
	var row = button%9
	var line = button/9 
	var quadrant = quadranten[line]
	
	
	#Check Row 
	for i in range (0,9):
		button = quadrant.get_child(i)
		button.get_node("Label").text = ""

	
	#Check Line 
	for i in range (0,9):
		quadrant = quadranten[i]
		button = quadrant.get_child(row)
		button.get_node("Label").text = ""
	
	#Check Quadrant 
	var start_row = 3 * (line / 3)
	var start_col = 3 * (row / 3)
	
	# Check the 3x3 quadrant
	for i in range(start_row, start_row + 3):
		quadrant = quadranten[i]
		for j in range(start_col, start_col + 3):
			button = quadrant.get_child(j)
			button.get_node("Label").text = ""
	

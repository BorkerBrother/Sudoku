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
	
	
	var button = self.name
	
	if self.text > "0":
		print("already set")
	else:
		if is_CoordinateProofed(button,key):
		# ÜBERPRÜFE SUDOKU WERTE FUNKTION 
			self.text = str(key)

func set_numbers():
	
	var gridContainer = $"/root/World/HBoxContainer/VBoxContainer/Quadranten"
	# // Get Buttons 
	var quadranten = gridContainer.get_children()
	
	var square1 = ["01","02","03","10","11","12","19","20","21"]
	
	
	# Quadranten 0-9 
	print("Buttons:")
	for i in range(0,9):
		#Buttons 0-9
		var quadrant = quadranten[i]
		for j in range (0,9):
			#PRINT Values
			var button = quadrant.get_child(j)
			#button.name = str(Global.sudoku_key[i][j])
			print(button.name)
			button.get_node("Label").text = str(button.name)
			
			
			if Global.sudoku_key[i][j] > "0" :
				button.text = str(Global.sudoku_key[i][j])
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
	var y = 0
	var x = 0
	var row1 = ["01","02","03","04","05","06","07","08","09"]
	var row2 = ["10","11","12","13","14","15","16","17","18"]
	var row3 = ["19","20","21","22","23","24","25","26","27"]
	
	var row4 = ["28","29","30","31","32","33","34","35","36"]
	var row5 = ["37","38","39","40","41","42","43","44","45"]
	var row6 = ["46","47","48","49","50","51","52","53","54"]
	
	var row7 = ["55","56","57","58","59","60","61","62","63"]
	var row8 = ["64","65","66","67","68","69","70","71","72"]
	var row9 = ["73","74","75","76","77","78","79","80","81"]
	
	
	#var row = int(button)/9
	if row1.has(button):
		y=0
	if row2.has(button):
		y=1
	if row3.has(button):
		y=2
	if row4.has(button):
		y=3
	if row5.has(button):
		y=4
	if row6.has(button):
		y=5
	if row7.has(button):
		y=6
	if row8.has(button):
		y=7
	if row9.has(button):
		y=8
	#Check Row 
	for i in range(0,9):
		if Global.sudoku_key[y][i] == str(key):
			print("Alreday set in Row") 
			return false
	#test.text ="1"
	return true


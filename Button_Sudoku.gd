extends Button

var format_string = "%s"
var key = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

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


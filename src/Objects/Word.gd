extends RichTextLabel


var word = ""

func choose_word():
	var f = File.new()
	f.open("res://assets/words.txt", File.READ)
	randomize()
	var index = randi() % 5000
	
	var lineCounter = 0
	while not f.eof_reached():
		word = f.get_line()
		if lineCounter == index:
			break
		lineCounter += 1
		
	get_node(".").text = word
	f.close()
	

func _ready() -> void:
	choose_word()


func set_word_position(pos: Vector2) -> void:
	self.rect_position = pos

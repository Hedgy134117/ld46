extends RichTextLabel


var word = ""

func load_words():
	var f = File.new()
	f.open("res://assets/words.txt", File.READ)
	randomize()
	var index = randi() % 1000
	
	var lineCounter = 0
	while not f.eof_reached():
		word = f.get_line()
		if lineCounter == index:
			print('hello')
			break
		lineCounter += 1
		
	get_node(".").text = word
	f.close()
	

func _ready() -> void:
	load_words()


func set_word_position(pos: Vector2) -> void:
	self.rect_position = pos

extends RichTextLabel


var word = ""
var speed = 0.5
var itRange = Vector2(75, 75)

func _ready() -> void:
	choose_word()


func _process(_delta: float) -> void:
	moveToIt()


func choose_word():
	var f = File.new()
	f.open("res://assets/words.txt", File.READ)
	randomize()
	var index = randi() % 58000
	
	var lineCounter = 0
	while not f.eof_reached():
		word = f.get_line()
		if lineCounter == index:
			break
		lineCounter += 1
		
	get_node(".").text = word
	f.close()


func moveToIt() -> void:
	var it = get_node("/root/Control/IT")
	var itPos = it.rect_position
	var dif = itPos - self.rect_position
	
	# Go right / left
	if dif.x > 0:
		self.rect_position.x += speed
	elif dif.x < 0:
		self.rect_position.x -= speed
	
	# Go up / down
	if dif.y > 0:
		self.rect_position.y += speed
	elif dif.y < 0:
		self.rect_position.y -= speed


func set_word_position(pos: Vector2) -> void:
	self.rect_position = pos

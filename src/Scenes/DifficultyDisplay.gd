extends RichTextLabel

func _ready() -> void:
	var Difficulty = get_node("/root/Difficulty")
	
	match Difficulty.startingDifficulty:
		1:
			self.text += str("Easy")
		2:
			self.text += str("Medium")
		3:
			self.text += str("Hard")
		4:
			self.text += str("Expert")
		5:
			self.text += str("Insane")

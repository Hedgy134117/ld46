extends RichTextLabel


func _process(_delta: float) -> void:
	var Score = get_node("/root/Score")
	self.text = "Score: " + str(Score.score)

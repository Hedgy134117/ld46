extends TextEdit


func _process(_delta: float) -> void:
	var words = get_words()
	
	for word in words:
		if get_node(".").text == word.text:
			word.queue_free()
			get_node(".").text = ""


func get_words() -> Array:
	var control = get_tree().get_root().get_node("Control")
	var objects = control.get_children()
	var words = []
	for obj in objects:
		if obj.name == "IT":
			continue

		if obj is RichTextLabel:
			if obj in words:
				continue
			words.append(obj)

	for word in words:
		if !is_instance_valid(word):
			words.erase(word)

	return words

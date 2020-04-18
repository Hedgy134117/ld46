extends TextEdit


func _process(_delta: float) -> void:
	var words = get_words()
	type_words(words)
	


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


func type_words(words: Array) -> void:
	var currentWord = null
	var currentText = get_node(".").text
	
	for word in words:
		# if words.text[0] == currentText
		# if words.text[0] and words.text[1] == currentText
		# if words.text[0] and words.text[1] and words.text[2] == currentText
		# ...
		if currentText != "":
			for i in range(word.text.length()):
				var textPortion = ""
				for j in range(i):
					textPortion += word.text[j]
				if currentText == textPortion:
					currentWord = word
			
		if word.text[0] == currentText or word.text[0] + word.text[1] == currentText:
			currentWord = word
		
		if currentText == word.text:
			explode_word(word)
	
	if currentWord != null:
		highlight_word(currentWord, words)
	else:
		unhilight_words(words)


func highlight_word(word: Control, words: Array) -> void:
	word.modulate = Color(1, 1, 1, 1)
	
	for otherWord in words:
		if otherWord != word:
			otherWord.modulate = Color(1, 1, 1, 0.5)


func unhilight_words(words: Array):
	for word in words:
		word.modulate = Color(1, 1, 1, 1)


func explode_word(word: Node):
	var explosion = load("res://src/Particles/Explosion.tscn")
	explosion = explosion.instance()
	explosion.position = word.rect_position
	explosion.emitting = true
	get_node("/root/Control").call_deferred("add_child", explosion)
	
	word.queue_free()
	increase_score()
	explode_sound()
	get_node(".").text = ""


func increase_score():
	get_node("/root/Score").score += 1


func explode_sound() -> void:
	get_node("/root/Control/SoundEffects").get_child(0).play()

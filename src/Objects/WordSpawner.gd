extends Control


func _ready() -> void:
	set_difficulty()


func set_difficulty() -> void:
	var Difficulty = get_node("/root/Difficulty")
	
	print(Difficulty.difficulty)
	match Difficulty.difficulty:
		1:
			get_node("Timer").wait_time = Difficulty.easyStartTime
		2:
			get_node("Timer").wait_time = Difficulty.medStartTime
		3:
			get_node("Timer").wait_time = Difficulty.hardStartTime
		4:
			get_node("Timer").wait_time = Difficulty.expertStartTime
		5:
			get_node("Timer").wait_time = Difficulty.insaneStartTime

func spawn_word() -> void:
	var obj = load("res://src/Objects/Word.tscn")
	obj = obj.instance()
	var newPos = Vector2(randi() % 2 * 1280, rand_range(0, 720))

	obj.set_word_position(newPos)
	get_node("/root/Control").call_deferred("add_child", obj)


func _on_Timer_timeout() -> void:
	set_difficulty()
	spawn_word()


func _on_DifficultyTimer_timeout() -> void:
	var Difficulty = get_node("/root/Difficulty")
	if Difficulty.difficulty != 1:
		get_node("/root/Difficulty").difficulty += 1
		print("CHANGED")
		set_difficulty()
	

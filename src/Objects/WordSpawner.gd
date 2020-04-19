extends Control


func _ready() -> void:
	set_difficulty()


func set_difficulty() -> void:
	var Difficulty = get_node("/root/Difficulty")
	
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
	var newPosPos = randi() % 4
	var newPos = Vector2()
	match(newPosPos):
		1:
			newPos = Vector2(randi() % 1280, 0)
		2:
			newPos = Vector2(1280, randi() % 720)
		3:
			newPos = Vector2(randi() % 1280, 720)
		4:
			newPos = Vector2(0, randi() % 720)
	

	obj.set_word_position(newPos)
	get_node("/root/Control").call_deferred("add_child", obj)


func _on_Timer_timeout() -> void:
	set_difficulty()
	spawn_word()


func _on_DifficultyTimer_timeout() -> void:
	var Difficulty = get_node("/root/Difficulty")
	if Difficulty.difficulty != 5:
		get_node("/root/Difficulty").difficulty += 1
		set_difficulty()
	

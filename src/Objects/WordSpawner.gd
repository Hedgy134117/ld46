extends Control


func _ready() -> void:
	spawn_word()

func spawn_word() -> void:
	var obj = load("res://src/Objects/Word.tscn")
	obj = obj.instance()
	var newPos = Vector2(rand_range(0, 1280), rand_range(0, 720))
	print(newPos)
	obj.set_word_position(newPos)
	get_node("/root/Control").call_deferred("add_child", obj)


func _on_Timer_timeout() -> void:
	#pass
	spawn_word()

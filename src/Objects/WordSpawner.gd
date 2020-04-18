extends Control


func spawn_word() -> void:
	var obj = load("res://src/Objects/Word.tscn")
	obj = obj.instance()
	obj.set_word_position(Vector2(randi() % 640, randi() % 360))
	get_node("/root/").call_deferred("add_child", obj)


func _on_Timer_timeout() -> void:
	spawn_word()

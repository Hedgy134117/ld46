extends Control




func _ready() -> void:
	spawn_word()


func spawn_word() -> void:
	var obj = load("res://src/Objects/Word.tscn")
	obj = obj.instance()
	obj.set_word_position(Vector2(50, 50))
	get_node("/root/").call_deferred("add_child", obj)
	print_tree()

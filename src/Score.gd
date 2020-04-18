extends Node

var score = 0

func _process(_delta: float) -> void:
	if get_tree().get_root().get_node_or_null("Menu"):
		score = 0

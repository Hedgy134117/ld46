extends ProgressBar


func _on_HealthBar_value_changed(value: float) -> void:
	if value <= 0:
		get_tree().change_scene("res://src/Scenes/Lose.tscn")

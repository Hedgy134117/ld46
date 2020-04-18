extends Control


func _on_PlayButton_button_up() -> void:
	get_tree().change_scene("res://src/Scenes/Main.tscn")


func _on_InstructionButton_button_up() -> void:
	get_tree().change_scene("res://src/Scenes/Instruction.tscn")


func _on_QuitButton_button_up() -> void:
	get_tree().quit()

extends RichTextLabel




func _on_Area2D_area_entered(area: Area2D) -> void:
	print(area.get_parent().text)
	area.get_parent().queue_free()

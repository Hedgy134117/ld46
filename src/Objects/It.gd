extends RichTextLabel


var healthToLose = 10

func _on_Area2D_area_entered(area: Area2D) -> void:
	area.get_parent().queue_free()
	get_node("/root/Control/HealthBar").value -= healthToLose
	get_node("/root/Control/SoundEffects").get_child(1).play()

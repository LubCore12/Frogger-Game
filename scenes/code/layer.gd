extends CanvasLayer

var counter = 1


func _on_label_timer_timeout() -> void:
	$Label.text = str(counter)
	counter += 1

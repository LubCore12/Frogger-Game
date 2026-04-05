extends Node2D

var car_scene := preload("res://scenes/car.tscn") 


func _on_finish_area_body_entered(body: Node2D) -> void:
	print(body)


func _on_car_timer_timeout() -> void:
	var car := car_scene.instantiate() as Area2D
	var pos_marker = $CarStartPositions.get_children().pick_random()
	car.position = pos_marker.position
	$Objects.add_child(car)

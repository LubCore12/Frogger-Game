extends Node2D

var car_scene := preload("res://scenes/car.tscn")
var counter := 0


func _on_finish_area_body_entered(_body: Node2D) -> void:
	call_deferred("change_scene")
	if counter > Global.score:
		Global.score = counter


func change_scene():
	get_tree().change_scene_to_file("res://scenes/title.tscn")


func _on_car_timer_timeout() -> void:
	var car := car_scene.instantiate() as Area2D
	var pos_marker = $CarStartPositions.get_children().pick_random()
	
	car.position = pos_marker.position
	$Objects.add_child(car)
	
	car.connect("body_entered", go_to_title)


func go_to_title(_body: Node2D):
	call_deferred("change_scene")


func _on_label_timer_timeout() -> void:
	counter += 1
	$CanvasLayer/Label.text = str(counter)

extends Area2D

var direction := Vector2.LEFT
var speed := 200
var car_types = [
	preload("res://graphics/cars/green.png"),
	preload("res://graphics/cars/red.png"),
	preload("res://graphics/cars/yellow.png")
]


func _ready() -> void:
	$CarSprite.texture = car_types.pick_random()
	if position.x < 0:
		direction = Vector2.RIGHT
		$CarSprite.flip_h = true
		

func _process(delta: float) -> void:
	position += round(direction * speed * delta)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if -200 > position.x or position.x > 200:
		queue_free()

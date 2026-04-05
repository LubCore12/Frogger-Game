extends Area2D

var direction := Vector2.LEFT
var speed := 200


func _ready() -> void:
	if position.x < 0:
		direction = Vector2.RIGHT
		$CarSprite.flip_h = true
		

func _process(delta: float) -> void:
	position += round(direction * speed * delta)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if -200 > position.x or position.x > 200:
		queue_free()

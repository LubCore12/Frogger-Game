extends Node2D

var direction := Vector2.ZERO
var speed := 200


func _physics_process(delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	
	if Input.is_action_just_pressed("confirm"):
		print("Something")
	
	position += delta * direction * speed

extends CharacterBody2D

var direction := Vector2.ZERO
var speed := 150
var is_standing = true


func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	
	velocity = direction * speed
	animation()
	move_and_slide()
	
	if Input.is_action_just_pressed("confirm"):
		print("Something")

func animation():
	if direction:
		if is_standing:
			$AnimatedSprite2D.frame = 1
		
		if direction.x != 0:
			$AnimatedSprite2D.play("left")
			$AnimatedSprite2D.flip_h = direction.x > 0
		else:
			$AnimatedSprite2D.play("up" if direction.y < 0 else "down")
			$AnimatedSprite2D.flip_h = false
			
		is_standing = false
	else:
		$AnimatedSprite2D.frame = 0
		is_standing = true

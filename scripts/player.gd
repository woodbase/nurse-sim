extends CharacterBody2D

@export var speed: float = 200.0

func _physics_process(_delta: float) -> void:
	var dir := Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)

	if dir.length_squared() > 0.0:
		dir = dir.normalized()
		velocity = dir * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()

extends CharacterBody2D

const JUMP_VELOCITY = -400.0

@export var gravity = 0

func _physics_process(delta):
	if !is_on_floor():
		if velocity.y < JUMP_VELOCITY * -1:
			velocity.y += gravity * delta

	move_and_slide()

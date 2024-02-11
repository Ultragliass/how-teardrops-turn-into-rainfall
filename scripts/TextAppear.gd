extends Node

@export var text: AnimatedSprite2D

func _on_body_entered(body): 
	if body.name == "Teardrop":
		set_deferred("monitoring", false)
		create_tween().tween_property(text, "modulate:a", 1, 1)

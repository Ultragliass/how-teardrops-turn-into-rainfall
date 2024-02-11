extends Node

@export var player_scale: Vector2
@export var camera_zoom: Vector2

func _on_body_entered(body):
	create_tween().tween_property(get_node("../Teardrop"), "scale",  player_scale, 1)
	
	create_tween().tween_property(get_node("../Teardrop/TeardropCamera"), "zoom", camera_zoom, 1)
	
	set_deferred("monitoring", false)

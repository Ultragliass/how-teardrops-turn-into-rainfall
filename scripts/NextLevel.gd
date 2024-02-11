extends Node

@export var next_level: PackedScene

func _on_body_entered(body):
	if body.name != "Teardrop": return
	
	var level = get_parent()
	var tween = create_tween()
	
	if get_node_or_null("../Parallax"): create_tween().tween_property(get_node("../Parallax/ParallaxLayer"), "modulate:a", 0, 0.5)
	
	if get_node_or_null("../MotionlessBackground"): create_tween().tween_property(get_node("../MotionlessBackground/Background"), "modulate:a", 0, 0.5)
	
	tween.connect("finished", move_to_next_stage)
	tween.tween_property(level, "modulate:a", 0, 0.5)
	

func move_to_next_stage():
	get_tree().change_scene_to_packed(next_level)

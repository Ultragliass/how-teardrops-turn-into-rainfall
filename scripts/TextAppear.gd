extends Node

@export var text: AnimatedSprite2D
@export var narration: AudioStream

func _on_body_entered(body): 
	if body.name == "Teardrop":
		set_deferred("monitoring", false)
		create_tween().tween_property(text, "modulate:a", 1, 1)
		
		var narrator = get_node("../Narration")
		narrator.stream = narration
		narrator.play()
		

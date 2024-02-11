extends Node

func _ready(): 
	self.modulate.a = 0
	
	match self.name:
		"Stage2-1":
			Global.play_ambiance("wind")
		
		"Stage3-1":
			Global.play_ambiance("sky_wind")
	
	create_tween().tween_property(self, "modulate:a", 1, 1)
	
	if get_node_or_null("./MotionlessBackground"):
		var background = get_node("./MotionlessBackground/Background")
		
		background.modulate.a = 0
		
		create_tween().tween_property(background, "modulate:a", 1, 1)

extends Area2D

var is_ascending = false
var current_background = 0
var change_timer = 0
func _process(delta):
	
	if !is_ascending:
		pass
	else:
		if current_background == 0:
			create_tween().tween_property(get_node("../Ascension2"), "modulate:a", 1, 0.5)
			create_tween().tween_property(get_node("../Ascension3"), "modulate:a", 1, 0.5)
			create_tween().tween_property(get_node("../Ascension4"), "modulate:a", 1, 0.5)
		
		change_timer += 1
		
		if current_background == 4:
			change_timer = 0
			is_ascending = false
		
		if change_timer == 15:
			
			change_timer = 0
			
			var background = get_node("../Ascension")
		
			current_background = current_background + 1 if current_background != 3 else 3
			
			if current_background > 1:
				create_tween().tween_property(get_node("../Ascension%s" % str(current_background)), "modulate:a", 0, 0.5)
			else: create_tween().tween_property(get_node("../Ascension"), "modulate:a", 0, 0.5)


func _on_body_entered(body):
	is_ascending = true
	
	set_deferred("monitoring", false)
	
	var player = get_node("../Teardrop")
	player.ascend_timeout = 150
	player.is_ascending = true

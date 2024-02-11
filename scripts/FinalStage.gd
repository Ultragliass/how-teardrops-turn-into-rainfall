extends Node2D

var can_quit = false

func _ready():
	Global.stop_playing()
	
	var tween = create_tween()
	
	tween.connect("finished", enable_quit)
	
	tween.tween_interval(2)
	tween.tween_property($Scene12, "modulate:a", 0, 0.5)
	
	tween.tween_interval(2)
	tween.tween_property($Scene11, "modulate:a", 0, 0.5)
	
	tween.tween_interval(2)
	tween.tween_property($Scene10, "modulate:a", 0, 0.5)
	
	tween.tween_interval(2)
	tween.tween_property($Scene9, "modulate:a", 0, 0.5)
	
	tween.tween_interval(2)
	tween.tween_property($Scene8, "modulate:a", 0, 0.5)
	
	tween.tween_interval(2)
	tween.tween_property($Scene7, "modulate:a", 0, 0.5)
	
	tween.tween_interval(2)
	tween.tween_callback($HuhSFX.play)
	tween.tween_property($Scene6, "modulate:a", 0, 0.5)
	
	tween.tween_interval(2)
	tween.tween_property($Scene5, "modulate:a", 0, 0.5)
	
	tween.tween_interval(2)
	tween.tween_property($Scene4, "modulate:a", 0, 0.5)
	
	tween.tween_interval(2)
	tween.tween_property($Scene3, "modulate:a", 0, 0.5)
	
	tween.tween_interval(2)
	tween.tween_property($Scene2, "modulate:a", 0, 0.5)
	
	tween.tween_interval(2)
	tween.tween_property($Scene1, "modulate:a", 0, 0.5)
	
func enable_quit(): can_quit = true

func _input (event: InputEvent):
	if Input.is_action_just_pressed("ui_cancel") and can_quit:
			get_tree().quit()

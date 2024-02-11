extends Control

var is_started = false

@export var initial_scene: PackedScene

func _on_area_2d_mouse_entered(): create_tween().tween_property($UI/CryButton, "scale", Vector2(1.2, 1.2), 0.1)

func _on_cry_button_area_mouse_exited(): create_tween().tween_property($UI/CryButton, "scale", Vector2(1, 1), 0.1)

func _on_cry_button_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and !is_started:
		is_started = true
		
		var tween = create_tween()
		tween.connect("finished", show_intro)
		tween.tween_property($UI, "modulate:a", 0, 2)
		
func show_intro():
	var tween = create_tween()
	tween.connect("finished", cry)
	tween.tween_property($Text, "modulate:a", 1, 2)
	tween.tween_interval(5)
	
func cry(): 
	$IntroEye.animation = "cry"
	$IntroEye.connect("animation_finished", fade_out)
	
func fade_out(): 
	create_tween().tween_property($IntroTear, "modulate:a", 1, 0.5)
	$IntroTear.gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	
	var tween = create_tween()
	tween.connect("finished", start_game)
	tween.tween_interval(2)
	tween.tween_property(self, "modulate:a", 0, 1)
	
func start_game():
	get_tree().change_scene_to_packed(initial_scene)
	
func _input (event: InputEvent):
	if Input.is_action_just_pressed("ui_cancel"):
			get_tree().quit()

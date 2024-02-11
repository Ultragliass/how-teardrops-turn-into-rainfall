extends CharacterBody2D

const SPEED: float = 125.0
const JUMP_VELOCITY: float = -400.0
const WINDUP_TIME: int = 19
const PUSH_FORCE: float = 80.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_windup: float = 0.0
var is_jumping: bool = false

@export var player_control_timeout: float
@export var initial_zoom: Vector2
@export var initial_scale: Vector2
@export var is_ascending: bool = false
@export var ascend_timeout: float = 0.0
@export var is_cloud: bool = false
@export var floor_snap: int = 35

func _ready():
	floor_snap_length = floor_snap
	floor_max_angle = 0
	$TeardropCamera.zoom = initial_zoom
	scale = initial_scale
	
	if is_cloud:
		$TeardropCollision.disabled = true
		$TeardropAnimation.animation = "gas"

func _physics_process(delta):
	if jump_windup > 0: jump_windup -= 1
	if player_control_timeout > 0: player_control_timeout -= 1
	else: floor_max_angle = 0.78539818525314
	if ascend_timeout > 0: ascend_timeout -= 1
	
	if is_cloud:
		velocity.y = -200
		move_and_slide()
		
		if position.y > 500: pass
		else: $TeardropCollision.disabled = false
		
		if position.y > -25: pass
		else: 
			$TeardropAnimation.animation = "idle"
			player_control_timeout = 100
		
		return
	
	if !jump_windup and is_jumping:
		velocity.y += gravity * delta
		is_jumping = false
		velocity.y = JUMP_VELOCITY
	
	if move_and_collide(Vector2(0, 100), true) and velocity.y > 300: $TeardropAnimation.animation = "fall"
	
	
	if is_ascending: 
		if ascend_timeout: pass
		else: 
			$TeardropAnimation.animation = "gas"
			velocity.y = velocity.y - 1 if velocity.y > JUMP_VELOCITY else JUMP_VELOCITY
	
	if !is_on_floor() and !is_ascending:
		if velocity.y < JUMP_VELOCITY * -1:
			velocity.y += gravity * delta
			
	if Input.is_action_just_pressed("ui_up") and is_on_floor() and !player_control_timeout and !is_ascending:
		if !jump_windup:
			jump_windup = WINDUP_TIME
			is_jumping = true
			$TeardropAnimation.animation = "jump"

	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction and !player_control_timeout and !is_ascending:
		$TeardropAnimation.flip_h = direction < 0
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	for i in get_slide_collision_count():
		var object = get_slide_collision(i)
		
		if object.get_collider() is RigidBody2D:
			object.get_collider().apply_central_impulse(-object.get_normal() * PUSH_FORCE)


func _on_teardrop_animation_animation_finished():
	if $TeardropAnimation.animation == "jump" or $TeardropAnimation.animation == "fall": 
		$TeardropAnimation.animation = "idle"
		$TeardropAnimation.play()
		
func _input (event: InputEvent):
	if Input.is_action_just_pressed("ui_cancel"):
			get_tree().quit()

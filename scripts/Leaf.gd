extends CharacterBody2D


const SPEED = 300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var static_rotation: float = 0

func _ready():
	var rng = RandomNumberGenerator.new()
	
	velocity = Vector2(rng.randi_range(-100, 100), rng.randi_range(-100, 100)).normalized() * rng.randi_range(50, 100)
	
	static_rotation = rng.randf_range(0.01, 0.05)

func _physics_process(delta):	
	if position.y > 500: queue_free()
	
	rotation += static_rotation
	
	if velocity.y < 80:
		velocity.y += delta * 80
		
		
	move_and_slide()

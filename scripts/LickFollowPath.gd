extends PathFollow2D

var speed: float = 1.0
var lick_delay: int = 0

func _ready(): progress_ratio = 0.1

func _process(delta):
	if lick_delay > 0: lick_delay -= 1
	
	if !lick_delay: progress_ratio += delta * speed
	
	if progress_ratio > 0.9: speed *= -1
	
	if progress_ratio < 0.1 and !lick_delay: 
		speed *= -1
		lick_delay = 30
	

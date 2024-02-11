extends Node2D

var leaf = preload("res://scenes/Leaf.tscn")

func _ready():
	preload("res://assets/entities/leaf1.png")
	preload("res://assets/entities/leaf2.png")
	preload("res://assets/entities/leaf3.png")

func _on_leaf_timer_timeout():
	var rng = RandomNumberGenerator.new()
	
	var new_leaf = leaf.instantiate()
	
	new_leaf.get_child(0).texture = load("res://assets/entities/leaf%s.png" % str(rng.randi_range(1, 3)))
	get_parent().add_child(new_leaf)
	new_leaf.position = Vector2(rng.randi_range(750, 1200), -200)
	

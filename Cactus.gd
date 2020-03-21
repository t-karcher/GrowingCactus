extends Node2D

const SEGMENT_HEIGHT = 53
const GROW_SPEED = 2

onready var sprite = $Sprite

export var target_height : int = 5
var current_height : float = 0
var previous_height : float = 0
var is_growing : bool = false

func start_growing():
	is_growing = true
	
func _process(delta):
	if current_height < target_height and is_growing:
		current_height += GROW_SPEED * delta
		position.y = -current_height * SEGMENT_HEIGHT
		if floor(current_height) > previous_height:
			add_segment()
			previous_height = current_height
			
func add_segment():
	var new_segment = sprite.duplicate()
	new_segment.frame = 1
	add_child(new_segment)
	new_segment.position.y = floor(current_height) * SEGMENT_HEIGHT

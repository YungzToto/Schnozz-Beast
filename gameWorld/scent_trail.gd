extends Line2D

var prev_pos: Vector2 = Vector2.ZERO
var player_radius: float = 0.0

# Setting the texture of the trail so that it's visible on screen
func _ready():
	var texture = get_parent().texture
	prev_pos = get_parent().global_position

# The process function sets the position and direction of the trail
func _process(delta):
	var current_position = get_parent().global_position
	var direction = (current_position - prev_pos).normalized()
	add_point(current_position - player_radius * direction)
	
	# Setting the size of the trail
	if points.size() > 30:
		remove_point(0)
	prev_pos = current_position

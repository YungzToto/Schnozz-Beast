extends Area2D

var speed = 300 # Setting the speed of the arrow

func _ready():
	set_as_top_level(true)
	
func _process(delta): # Setting up the physics of the arrow 
	position += (Vector2.RIGHT * speed).rotated(rotation) * delta

#Setting up a signal function for when the arrow leaves the screen
func _on_visible_on_screen_enabler_2d_screen_exited(): 
	queue_free()


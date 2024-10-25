extends Camera2D

@export var zoomSpeed : float = 10
var zoomTarget : Vector2 # A vectore that will influence the direction of zooming

# Called when the node enters the scene tree for the first time.
func _ready():
	zoomTarget = zoom
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Zoom(delta)
	
func Zoom(delta):
	if Input.is_action_just_pressed("camera_zoom_in"):
		zoomTarget *=  1.1
	if Input.is_action_just_pressed("camera_zoom_out"):
		zoomTarget *= 0.9
		
	zoom = zoom.slerp(zoomTarget, zoomSpeed * delta) # Slowing down the zooming process on the player
	
func player(): # Pass what we've done so far into this function
	pass
	


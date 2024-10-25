extends CharacterBody2D

var speed = 100
var player_state # The player's status (either stationary or moving)

func _physics_process(delta):
	# Setting the input controls for the player (Use the project settings to set them up too)
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "Idle_Animation"
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"
		
	velocity = direction * speed
	move_and_slide() # Function to make the player move 
	
	play_anim(direction) # Calling a function to implement walking animations on the player

func play_anim(dir):
	if player_state == "Idle_Animation":
		$AnimatedSprite2D.play("Idle_Animation")
	if player_state == "walking":
		if dir.y == -1:
			$AnimatedSprite2D.play("Walk_Up") 
		if dir.x == 1:
			$AnimatedSprite2D.play("Walk_Right")
		if dir.y == -1:
			$AnimatedSprite2D.play("Walk_Down")
		if dir.x == 1:
			$AnimatedSprite2D.play("Walk_Left")			
			
		if dir.x > 0.5 and dir.y < -0.5:
			$AnimatedSprite2D.play("NE_Walk")	
		if dir.x > 0.5 and dir.y > -0.5:
			$AnimatedSprite2D.play("SE_Walk")	
		if dir.x < -0.5 and dir.y > 0.5:
			$AnimatedSprite2D.play("SW_Walk")	
		if dir.x < -0.5 and dir.y < -0.5:
			$AnimatedSprite2D.play("NW_Walk")	
	
func player(): # Pass what we've done so far into this function
	pass
			
		


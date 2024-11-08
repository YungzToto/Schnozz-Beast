extends CharacterBody2D

var speed = 100
var player_state # The player's status (either stationary or moving)
var bow = true # Equipted the arrow
var bow_cooldown = true # Setting an alotted time between arrows so that the player isn't firing them infinately 
var arrow = preload("res://Scenes/arrow.tscn") # Calling the arrow scene
var mouse_loc = null # Setting the location of the mouse for when the player shoots the arrow

func _physics_process(delta):
        mouse_loc = get_global_mouse_position() - self.position
	print(mouse_loc)

	# Setting the input controls for the player (Use the project settings to set them up too)
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "Idle_Animation"
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"
		
	velocity = direction * speed
	move_and_slide() # Function to make the player move

        var mouse_pos = get_global_mouse_position()
	$Marker2D.look_at(mouse_pos)
	
	if Input.is_action_just_pressed("left_mouse") and bow and bow_cooldown:
		bow_cooldown = false
		var shoot_arrow = arrow.instantiate() # Shooting the arrow 
		shoot_arrow.rotation = $Marker2D.rotation # Rotating the player to shoot in any direction
		shoot_arrow.global_position = $Marker2D.global_position # Sets the postion of the arrow
		add_child(shoot_arrow) # Shows the arrow on the screen
		
		await get_tree().create_timer(0.5).timeout
		bow_cooldown = true
	
	play_anim(direction) # Calling a function to implement walking animations on the player

func play_anim(dir):
	if !bow:
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

         if bow:
		if mouse_loc.x >= -25 and mouse_loc.x <= 25 and mouse_loc.y < 0:
			$AnimatedSprite2D.play("Up_Attack")
		if mouse_loc.y >= -25 and mouse_loc.y <= 25 and mouse_loc.x > 0:
			$AnimatedSprite2D.play("Right_Attack")
		if mouse_loc.x >= -25 and mouse_loc.x <= 25 and mouse_loc.y < 0:
			$AnimatedSprite2D.play("Down_Attack")
		if mouse_loc.y >= -25 and mouse_loc.y <= 25 and mouse_loc.x > 0:
			$AnimatedSprite2D.play("Left_Attack")
			
		if mouse_loc.x >= 25 and mouse_loc.y <= -25:
			$AnimatedSprite2D.play("NE_Attack")
		if mouse_loc.x >= 0.5 and mouse_loc.y >= 25:
			$AnimatedSprite2D.play("SE_Attack")
		if mouse_loc.x <= -0.5 and mouse_loc.y >= 25:
			$AnimatedSprite2D.play("SW_Attack")
		if mouse_loc.x <= -25 and mouse_loc.y <= -25:
			$AnimatedSprite2D.play("NW_Attack")
	
func player(): # Pass what we've done so far into this function
	pass
			
		


extends StaticBody2D

var state = "day" # The current state
var change_state = false
var day_length = 15 # length of daytime in seconds 
var night_length = 5 # length of nighttime in seconds 

func _ready():
	if state == "day":
		$ColorRect.color.a = 0
	elif state == "night":
		$ColorRect.color.a = 90

func _on_timer_timeout():
	if state == "day":
		state = "night"
	elif state == "night":
		state = "day"
		
	change_state = true
	
func _process(delta): # Using this function to change the environment from night to day and vice versa
	if change_state == true:
		change_state = false
		if state == "day":
			change_to_day()
		elif state == "night":
			change_to_night()
			
func change_to_day(): # Calling the animation player and timer to change from night to day
	$AnimationPlayer.play("nighttoday")
	$Timer.wait_time = day_length
	$Timer.start()
	
func change_to_night():  # Calling the animation player and timer to change from day to night
	$AnimationPlayer.play("daytonight")
	$Timer.wait_time = night_length
	$Timer.start()
	
	
	


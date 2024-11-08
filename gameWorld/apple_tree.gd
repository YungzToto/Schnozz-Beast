# I THINK IT'S BEST THAT YOU IGNORE THIS CODE. I WAS TRYING TO MAKE THE APPLE TREE SPRITES DROP APPLES FOR THE PLAYER TO PICK UP FOR FUNSIES AND IT HASN'T BEEN WORKING SO FAR!

extends Node2D

var state = "no apples" # No apples in the general area
var player_in_area = false # Checking if the player is in the area to pick the apples
var apple = preload("res://Scenes/collect_apple.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if state == "no apples":
		$apple_timer.start()
		
# Creating a function to see if the player is in the area to pick the apples after they grow
func _process(delta):
	if state == "no apples":
		$AnimatedSprite2D.play("no apples")
	if state == "apples":
		$AnimatedSprite2D.play("apples")
		if player_in_area:
			if Input.is_action_just_pressed("pick_apple"): # Press "e" to pick up an apple
				state = "no apples"
				drop_apple()
		
func _on_pickable_area_body_entered(body): # Gives the player the ability to pick up an apple
	if body.has_method("player"):
		player_in_area = true
	
func _on_pickable_area_body_exited(body):
	if body.has_method("player"):
		player_in_area = false

func _on_apple_timer_timeout(): # Sets a timer that drops an apple when it stops 
	if state == "no apples":
		state = "apples"
		
func drop_apple(): # Creating a function to drop the apple from the tree 
	var apple_instance = apple.instanciate()
	apple_instance.global_position = $Marker2D.global_position
	
	get_parent().add_child(apple_instance) # Spawning the apple on the ground 
	$apple_timer.start()
	
	


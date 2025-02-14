extends Control

# Making each button interactive 
func _on_start_pressed():
	print("Start button pressed")
	get_tree().change_scene_to_file("res://Scenes/schnozz_world.tscn") # Starts playing the game

func _on_exit_pressed():
	print("Exit button pressed")
	get_tree().quit() # Quit the game


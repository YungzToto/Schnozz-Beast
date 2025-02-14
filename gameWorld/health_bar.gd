extends ProgressBar

@onready var timer = $Timer
@onready var damage_bar = $DamageBar
var parent 
var max_amount_health
var min_amount_health

var health = 0 : set = _set_health # Initiating a setter function to change the value of the health bar 
	
func _set_health(new_health):
	var prev_health = health
	health = min(max_value, new_health)
	value = health
	
	if health <= 0:
		queue_free()
		
	if health < prev_health:
		timer.start()
	else:
		damage_bar.value = health

# Declaring the values for the health and damage bars
func _init_health(_health):
	health = _health
	max_value = health
	value = health 
	damage_bar.max_value = health
	damage_bar.value = health
	
func _on_timer_timeout():
	damage_bar.value = health


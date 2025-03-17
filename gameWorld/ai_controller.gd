extends AIController2D

var move = Vector2.ZERO

@onready var slime: CharacterBody2D = $".."
@onready var detection: Area2D = $"../Scent_Detection"

#-- Methods that need implementing using the "extend script" option in Godot --#
func get_obs() -> Dictionary:
	var obs := [
		slime.position.x,
		slime.position.y,
		detection.position.x,
		detection.position.y
	]
	return {"obs": obs}

func get_reward() -> float:
	return reward

func get_action_space() -> Dictionary:
	return {
		"move" : {
			"size": 2,
			"action_type": "continuous"
		},
	}

func set_action(action) -> void:
	move.x = action["move"][0]
	move.y = action["move"][1]


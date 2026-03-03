extends Node

func _ready():
	var result = ProcedureResult.data
	$UI/VBoxContainer/ScoreLabel.text = "Score: " + str(result.get("score", 0))
	var aseptic_broken = result.get("aseptic_broken", false)
	$UI/VBoxContainer/AsepticLabel.text = "Aseptic Status: " + ("BROKEN" if aseptic_broken else "OK")
	if aseptic_broken:
		$UI/VBoxContainer/AsepticLabel.modulate = Color(1, 0.2, 0.2, 1)
	var mistakes = result.get("mistakes", [])
	if mistakes.is_empty():
		$UI/VBoxContainer/MistakesLabel.text = "Mistakes: None"
	else:
		$UI/VBoxContainer/MistakesLabel.text = "Mistakes: " + ", ".join(mistakes)

func _on_restart_pressed():
	ProcedureResult.data = {}
	get_tree().change_scene_to_file("res://scenes/pvk_room.tscn")

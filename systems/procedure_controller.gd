class_name ProcedureController

var steps: Array = []
var current_step: int = 0
var aseptic_broken: bool = false
var mistakes: Array = []
var score: int = 100
var procedure_complete: bool = false

func initialize(step_array: Array) -> void:
	steps = step_array
	current_step = 0
	aseptic_broken = false
	mistakes = []
	score = 100
	procedure_complete = false

func submit_action(action_name: String) -> void:
	if procedure_complete or current_step >= steps.size():
		return

	if action_name == steps[current_step]:
		current_step += 1
		if current_step >= steps.size():
			procedure_complete = true
	else:
		mistakes.append(action_name)
		score -= 10
		var skin_disinfection_index = steps.find("skin_disinfection")
		if skin_disinfection_index != -1 and current_step > skin_disinfection_index and not procedure_complete:
			aseptic_broken = true
			score -= 20

func is_complete() -> bool:
	return procedure_complete

func get_result() -> Dictionary:
	return {
		"score": score,
		"aseptic_broken": aseptic_broken,
		"mistakes": mistakes
	}

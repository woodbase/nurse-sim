extends Node

var procedure_controller: ProcedureController
var pvk_data

func _ready():
	pvk_data = load("res://procedures/pvk_data.gd").new()
	procedure_controller = ProcedureController.new()
	procedure_controller.initialize(pvk_data.STEPS)

func _on_action_pressed(action_name: String):
	procedure_controller.submit_action(action_name)
	if procedure_controller.is_complete():
		var result = procedure_controller.get_result()
		ProcedureResult.data = result
		get_tree().change_scene_to_file("res://scenes/feedback_screen.tscn")

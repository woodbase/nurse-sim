extends CharacterBody2D

const SPEED: float = 200.0

## Interactable nodes currently overlapping the InteractionArea.
var nearby_interactables: Array[Interactable] = []


func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and nearby_interactables.size() > 0:
		var interactable: Interactable = nearby_interactables[0]
		if is_instance_valid(interactable):
			interactable.interact(self)


func _on_interaction_area_area_entered(area: Area2D) -> void:
	if area is Interactable:
		nearby_interactables.append(area)
		area.show_prompt()


func _on_interaction_area_area_exited(area: Area2D) -> void:
	if nearby_interactables.has(area):
		nearby_interactables.erase(area)
		area.hide_prompt()

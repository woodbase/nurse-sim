class_name Interactable
extends Area2D

## Reusable interactable component.
## Extend this script and override interact() to add object-specific behavior.
## Requires a child Label node named "PromptLabel".

@export var prompt_text: String = "Press E to interact"

@onready var prompt_label: Label = $PromptLabel


func _ready() -> void:
	if not prompt_label:
		push_error("Interactable: PromptLabel node not found. Ensure a Label node named 'PromptLabel' is added as a child.")
		return
	prompt_label.text = prompt_text
	prompt_label.visible = false


## Called by the player when entering interaction range.
func show_prompt() -> void:
	if prompt_label:
		prompt_label.visible = true


## Called by the player when leaving interaction range.
func hide_prompt() -> void:
	if prompt_label:
		prompt_label.visible = false


## Override this method in objects that extend Interactable.
func interact(player: Node) -> void:
	pass

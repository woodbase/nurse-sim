extends Node

var inventory_system: InventorySystem
var pvk_data

@onready var missing_items_label: Label = $UI/VBoxContainer/MissingItemsLabel

func _ready():
	pvk_data = load("res://procedures/pvk_data.gd").new()
	inventory_system = InventorySystem.new()
	inventory_system.required_items = pvk_data.REQUIRED_ITEMS

	for item_name in pvk_data.REQUIRED_ITEMS:
		var item = InventoryItem.new(item_name)
		inventory_system.add_item_to_tray(item)

func _on_start_procedure_pressed():
	if inventory_system.validate_tray():
		get_tree().change_scene_to_file("res://scenes/technical_ui.tscn")
	else:
		var missing = inventory_system.get_missing_items()
		missing_items_label.text = "Missing: " + ", ".join(missing)
		missing_items_label.visible = true

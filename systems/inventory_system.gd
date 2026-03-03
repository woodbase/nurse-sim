class_name InventorySystem

var tray_items: Array = []
var required_items: Array = []

func add_item_to_tray(item: InventoryItem) -> void:
	tray_items.append(item)

func remove_item_from_tray(item: InventoryItem) -> void:
	tray_items.erase(item)

func _get_tray_names() -> Array:
	var tray_names = []
	for item in tray_items:
		tray_names.append(item.item_name)
	return tray_names

func validate_tray() -> bool:
	var tray_names = _get_tray_names()
	for required in required_items:
		if not required in tray_names:
			return false
	return true

func get_missing_items() -> Array:
	var tray_names = _get_tray_names()
	var missing = []
	for required in required_items:
		if not required in tray_names:
			missing.append(required)
	return missing

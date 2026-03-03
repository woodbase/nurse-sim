class_name InventoryItem

var item_name: String
var sterile: bool

func _init(name: String, is_sterile: bool = true):
	item_name = name
	sterile = is_sterile

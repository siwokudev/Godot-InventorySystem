class_name InventoryScreen extends Control

@onready var container : HBoxContainer = $HBoxContainer
@onready var inventoryItemControlScene : PackedScene = preload("res://scenes/inventory_item_control.tscn")

@export var inventory : Inventory

var offset = 0

var itemsControl : Array[InventoryItemControl]

func _ready() -> void:
	for item : Item in inventory.items:
		createInventoryItemControl(item)
	
	if itemsControl.size():
		itemsControl[0].selected()
	
func createInventoryItemControl(item : Item) -> void:
	var inventoryItemControl : InventoryItemControl = inventoryItemControlScene.instantiate() as InventoryItemControl
	inventoryItemControl.create(item)
	inventoryItemControl.offset_left = offset
	
	container.add_child(inventoryItemControl)
	itemsControl.push_back(inventoryItemControl)

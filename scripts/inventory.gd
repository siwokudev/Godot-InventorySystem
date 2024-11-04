class_name Inventory extends Node

signal updated

@export var items : Array[Item]

func _ready() -> void:
	_test()

func addItem(item : Item) -> void:
	items.push_back(item)
	updated.emit()
	
func dropItem(item : Item) -> void:
	items.erase(item)
	updated.emit()
	
func dropItemByIndex(index : int) -> void:
	items.remove_at(index)
	updated.emit()


func _test() -> void: #eliminar esta funcion, ya que el llamado a la funcion addItem lo debe realizar el objeto cuando se recoge
	addItem(_createUsableItem())
	addItem(_createEquipableItem())
	addItem(_createUselessItem())
	addItem(_createPermanentItem())

func _createUsableItem() -> Item:
	var item = Item.new()
	item.name = "usable Item X"
	item.canBeDroped = true
	item.canBeUsed = true
	item.canBeEquiped = false
	return item

func _createEquipableItem() -> Item:
	var item = Item.new()
	item.name = "equipable Item Y"
	item.canBeDroped = true
	item.canBeUsed = false
	item.canBeEquiped = true
	return item

func _createUselessItem() -> Item:
	var item = Item.new()
	item.name = "useless Item Z"
	item.canBeDroped = true
	item.canBeUsed = false
	item.canBeEquiped = false
	return item
	
func _createPermanentItem() -> Item:
	var item = Item.new()
	item.name = "permanent Item A"
	item.canBeDroped = false
	item.canBeUsed = false
	item.canBeEquiped = false
	return item

class_name InventoryItemControl extends Control

@export var actionsContainer : VBoxContainer
@export var nameLabel : Label

enum ACTION {USE, EQUIP, DROP}

var inventoryItemName : String
	
func selected() -> void:
	var firstAction : Button = actionsContainer.get_child(0) as Button
	firstAction.grab_focus()

func create(item : Item) -> void:
	inventoryItemName = item.name
	nameLabel.text = inventoryItemName
	if item.canBeUsed:
		createButton(ACTION.USE)
	if item.canBeEquiped:
		createButton(ACTION.EQUIP)
	if item.canBeDroped:
		createButton(ACTION.DROP)

func createButton(action : ACTION) -> void:
	var button = Button.new()
	
	match action:
		ACTION.USE:
			button.text = "Use"
			button.pressed.connect(_onUse)
		ACTION.EQUIP:
			button.text = "Equip"
			button.pressed.connect(_onEquip)
		ACTION.DROP:
			button.text = "Drop"
			button.pressed.connect(_onDrop)
	actionsContainer.add_child(button)
	
func _onUse() -> void:
	print("use item: " + inventoryItemName)
	
func _onEquip() -> void:
	print("equipe item: " + inventoryItemName)
	
func _onDrop() -> void:
	print("drop item: " + inventoryItemName)

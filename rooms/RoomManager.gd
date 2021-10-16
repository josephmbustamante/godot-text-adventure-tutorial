extends Node


func _ready() -> void:
	$StartingShed.connect_exit_unlocked("west", $BackOfInn)

	$BackOfInn.connect_exit_unlocked("path", $VillageSquare)

	$VillageSquare.connect_exit_unlocked("east", $InnDoor)
	$VillageSquare.connect_exit_unlocked("north", $Gate)
	$VillageSquare.connect_exit_unlocked("west", $Field)

	$InnDoor.connect_exit_unlocked("inside", $InnInside)

	var innkeeper = load_npc("Innkeeper")
	$InnInside.add_npc(innkeeper)
	$InnInside.connect_exit_unlocked("south", $InnKitchen)

	var exit = $InnKitchen.connect_exit_locked("south", $BackOfInn)
	var key = load_item("Key")
	key.use_value = exit
	$InnKitchen.add_item(key)

	var guard = load_npc("Guard")
	$Gate.add_npc(guard)
	$Gate.connect_exit_unlocked("forest", $Forest, "gate")


func load_item(item_name: String):
	return load("res://items/" + item_name + ".tres")


func load_npc(npc_name: String):
	return load("res://npcs/" + npc_name + ".tres")

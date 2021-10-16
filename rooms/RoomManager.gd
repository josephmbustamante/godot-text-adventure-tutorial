extends Node


func _ready() -> void:
	var key = Item.new()
	key.initialize("key", Types.ItemTypes.KEY)

	$StartingShed.connect_exit_unlocked("west", $BackOfInn)

	$BackOfInn.connect_exit_unlocked("path", $VillageSquare)

	$VillageSquare.connect_exit_unlocked("east", $InnDoor)
	$VillageSquare.connect_exit_unlocked("north", $Gate)
	$VillageSquare.connect_exit_unlocked("west", $Field)

	$InnDoor.connect_exit_unlocked("inside", $InnInside)

	$InnInside.connect_exit_unlocked("south", $InnKitchen)

	var exit = $InnKitchen.connect_exit_locked("south", $BackOfInn)
	key.use_value = exit
	$InnKitchen.add_item(key)

	$Gate.connect_exit_unlocked("forest", $Forest, "gate")


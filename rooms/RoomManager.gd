extends Node


func _ready() -> void:
	var key = Item.new()
	key.initialize("key", Types.ItemTypes.KEY)
	key.use_value = $ShedRoom

	$HouseRoom.connect_exit_unlocked("east", $OutsideRoom)

	$OutsideRoom.add_item(key)
	$OutsideRoom.connect_exit_locked("north", $ShedRoom)

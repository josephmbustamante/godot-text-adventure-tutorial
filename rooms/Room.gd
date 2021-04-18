tool
extends PanelContainer
class_name Room


export (String) var room_name = "Room Name" setget set_room_name
export (String, MULTILINE) var room_description = "This is the description of the room." setget set_room_description

var exits: Dictionary = {}
var items: Array = []


func set_room_name(new_name: String):
	$MarginContainer/Rows/RoomName.text = new_name
	room_name = new_name


func set_room_description(new_description: String):
	$MarginContainer/Rows/RoomDescription.text = new_description
	room_description = new_description


func add_item(item: Item):
	items.append(item)


func remove_item(item: Item):
	items.erase(item)


func get_full_description() -> String:
	var full_description = PoolStringArray([
		get_room_description(),
		get_item_description(),
		get_exit_description()
	]).join("\n")
	return full_description


func get_room_description() -> String:
	return "You are now in: " + room_name + ". It is " + room_description


func get_item_description() -> String:
	if items.size() == 0:
		return "No items to pickup."

	var item_string = ""
	for item in items:
		item_string += item.item_name + " "
	return "Items: " + item_string


func get_exit_description() -> String:
	return "Exits: " + PoolStringArray(exits.keys()).join(" ")


func connect_exit(direction: String, room):
	var exit = Exit.new()
	exit.room_1 = self
	exit.room_2 = room
	exits[direction] = exit
	match direction:
		"west":
			room.exits["east"] = exit
		"east":
			room.exits["west"] = exit
		"north":
			room.exits["south"] = exit
		"south":
			room.exits["north"] = exit
		_:
			printerr("Tried to connect invalid direction: %s", direction)

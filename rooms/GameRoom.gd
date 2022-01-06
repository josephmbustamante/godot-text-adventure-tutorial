tool
extends PanelContainer
class_name GameRoom


export (String) var room_name = "Room Name" setget set_room_name
export (String, MULTILINE) var room_description = "This is the description of the room." setget set_room_description

var exits: Dictionary = {}
var npcs: Array = []
var items: Array = []


func set_room_name(new_name: String):
	$MarginContainer/Rows/RoomName.text = new_name
	room_name = new_name


func set_room_description(new_description: String):
	$MarginContainer/Rows/RoomDescription.text = new_description
	room_description = new_description


func add_npc(npc: NPC):
	npcs.append(npc)


func add_item(item: Item):
	items.append(item)


func remove_item(item: Item):
	items.erase(item)


func get_full_description() -> String:
	var full_description = PoolStringArray([get_room_description()])

	var npc_description = get_npc_description()
	if npc_description != "":
		full_description.append(npc_description)

	var item_description = get_item_description()
	if item_description != "":
		full_description.append(item_description)

	full_description.append(get_exit_description())

	var full_description_string = full_description.join("\n")
	return full_description_string


func get_room_description() -> String:
	return "You are now in: " + Types.wrap_location_text(room_name) + ". It is " + room_description


func get_npc_description() -> String:
	if npcs.size() == 0:
		return ""

	var npc_string = ""
	for npc in npcs:
		npc_string += Types.wrap_npc_text(npc.npc_name) + " "
	return "NPCs: " + npc_string


func get_item_description() -> String:
	if items.size() == 0:
		return ""

	var item_string = ""
	for item in items:
		item_string += Types.wrap_item_text(item.item_name) + " "
	return "Items: " + item_string


func get_exit_description() -> String:
	return "Exits: " + Types.wrap_location_text(PoolStringArray(exits.keys()).join(" "))


func connect_exit_unlocked(direction: String, room, room_2_override_name = "null"):
	return _connect_exit(direction, room, false, room_2_override_name)


func connect_exit_locked(direction: String, room, room_2_override_name = "null"):
	return _connect_exit(direction, room, true, room_2_override_name)


func _connect_exit(direction: String, room, is_locked: bool = false, room_2_override_name = "null"):
	var exit = Exit.new()
	exit.room_1 = self
	exit.room_2 = room
	exit.is_locked = is_locked
	exits[direction] = exit

	if room_2_override_name != "null":
		room.exits[room_2_override_name] = exit
	else:
		match direction:
			"west":
				room.exits["east"] = exit
			"east":
				room.exits["west"] = exit
			"north":
				room.exits["south"] = exit
			"south":
				room.exits["north"] = exit
			"path":
				room.exits["path"] = exit
			"inside":
				room.exits["outside"] = exit
			"outside":
				room.exits["inside"] = exit
			_:
				printerr("Tried to connect invalid direction: ", direction)

	return exit

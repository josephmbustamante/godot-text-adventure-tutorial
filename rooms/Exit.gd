extends Resource
class_name Exit


var room_1 = null
var room_1_is_locked := false

var room_2 = null
var room_2_is_locked := false


func is_other_room_locked(current_room) -> bool:
	if current_room == room_1:
		return room_2_is_locked
	elif current_room == room_2:
		return room_1_is_locked
	else:
		printerr("The room you tried to find is not connected to this exit.")
		return true



func get_other_room(current_room):
	if current_room == room_1:
		return room_2
	elif current_room == room_2:
		return room_1
	else:
		printerr("The room you tried to find is not connected to this exit.")
		return null

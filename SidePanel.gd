extends PanelContainer


onready var room_name = $MarginContainer/Rows/TitleSection/RoomNameLabel
onready var room_description = $MarginContainer/Rows/RoomDescriptionLabel

onready var exit_label = $MarginContainer/Rows/ListArea/ExitLabel
onready var npc_label = $MarginContainer/Rows/ListArea/NpcLabel
onready var item_label = $MarginContainer/Rows/ListArea/ItemLabel


func handle_room_changed(new_room):
	room_name.text = new_room.room_name
	room_description.text = new_room.room_description

	exit_label.bbcode_text = new_room.get_exit_description()

	var npc_string = new_room.get_npc_description()
	if npc_string == "":
		npc_label.hide()
	else:
		npc_label.show()
		npc_label.bbcode_text = npc_string

	var item_string = new_room.get_item_description()
	if item_string == "":
		item_label.hide()
	else:
		item_label.show()
		item_label.bbcode_text = item_string


func handle_room_updated(current_room):
	handle_room_changed(current_room)

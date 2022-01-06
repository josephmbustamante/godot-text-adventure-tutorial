extends Control


onready var game_info = $Background/MarginContainer/Rows/GameInfo
onready var command_processor = $CommandProcessor
onready var room_manager = $RoomManager
onready var player = $Player


func _ready() -> void:
	game_info.create_response("Welcome to the retro text adventure! You can type 'help' to see available commands.")

	var starting_room_response = command_processor.initialize(room_manager.get_child(0), player)
	game_info.create_response(starting_room_response)


func _on_Input_text_entered(new_text: String) -> void:
	if new_text.empty():
		return

	var response = command_processor.process_command(new_text)
	game_info.create_response_with_input(response, new_text)

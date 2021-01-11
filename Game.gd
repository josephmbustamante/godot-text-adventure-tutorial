extends Control


const InputResponse = preload("res://InputResponse.tscn")

onready var history_rows = $Background/MarginContainer/Rows/GameInfo/ScrollContainer/HistoryRows


func _on_Input_text_entered(new_text: String) -> void:
	var input_response = InputResponse.instance()
	input_response.set_text(new_text, "This is where a response would go.")
	history_rows.add_child(input_response)

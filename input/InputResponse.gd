extends MarginContainer


onready var zebra = $Zebra
onready var input_label = $Rows/InputHistory
onready var response_label = $Rows/Response


func set_text(response: String, input: String = ""):
	if input == "":
		input_label.queue_free()
	else:
		input_label.text = " > " + input

	response_label.bbcode_text = response

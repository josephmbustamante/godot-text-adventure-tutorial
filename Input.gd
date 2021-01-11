extends LineEdit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grab_focus()


func _on_Input_text_entered(new_text: String) -> void:
	clear()

extends Node


func _ready() -> void:
	$HouseRoom.connect_exit("east", $OutsideRoom)

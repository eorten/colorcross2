extends Control

signal pressed
func set_color(clr:Color):
	$Arrow.modulate = clr
func set_rot(rot:float):
	$Arrow.rotation_degrees = rot

func _on_button_pressed() -> void:
	pressed.emit()

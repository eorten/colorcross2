extends Control
@export var left_arrow:Texture2D
signal pressed
func set_color(clr:Color):
	$Arrow.modulate = clr

func set_rot(rot:float):
	$Arrow.texture = left_arrow

func _on_button_pressed() -> void:
	pressed.emit()

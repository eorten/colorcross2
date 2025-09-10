class_name PlayMenuScreen extends Control
@onready var _3x3_button: Button = %"3x3Button"

func _ready() -> void:
	_3x3_button.pressed.connect(func(): ButtonEvents.on_play_button_pressed.emit(3))

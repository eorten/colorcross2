class_name PlayMenuScreen extends Control
@onready var _3x3_button: Button = %"3x3Button"
@onready var _4x4_button_2: Button = %"4x4Button2"
@onready var _5x5_button_3: Button = %"5x5Button3"
@onready var _6x6_button_4: Button = %"6x6Button4"

func _ready() -> void:
	_3x3_button.pressed.connect(func(): ButtonEvents.on_play_button_pressed.emit(3))
	_4x4_button_2.pressed.connect(func(): ButtonEvents.on_play_button_pressed.emit(4))
	_5x5_button_3.pressed.connect(func(): ButtonEvents.on_play_button_pressed.emit(5))
	_6x6_button_4.pressed.connect(func(): ButtonEvents.on_play_button_pressed.emit(6))

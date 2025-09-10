class_name MainMenuScreen extends Control
@onready var play_button: Button = %PlayButton

func _ready() -> void:
	play_button.pressed.connect(ButtonEvents.on_play_menu_button_pressed.emit)

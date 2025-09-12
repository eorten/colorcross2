class_name MainMenuScreen extends Control
@onready var play_button: Button = %PlayButton
@onready var exit_button: Button = %ExitButton

func _ready() -> void:
	play_button.pressed.connect(ButtonEvents.on_play_menu_button_pressed.emit)
	exit_button.pressed.connect(ButtonEvents.on_quit_button_pressed.emit)

class_name MainMenuScreen extends Control
@onready var play_button: Button = %PlayButton
@onready var exit_button: Button = %ExitButton
@onready var tutorial_button: Button = %TutorialButton

func _ready() -> void:
	play_button.pressed.connect(ButtonEvents.on_play_menu_button_pressed.emit)
	exit_button.pressed.connect(ButtonEvents.on_quit_button_pressed.emit)
	tutorial_button.pressed.connect(ButtonEvents.on_tutorial_button_pressed.emit)

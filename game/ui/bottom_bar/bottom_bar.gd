class_name BottomBar extends Node
@onready var main_menu_button: TextureButton = %MainMenuButton
@onready var hint_button: TextureButton = %HintButton

func _ready() -> void:
	main_menu_button.pressed.connect(func(): ButtonEvents.on_main_menu_button_pressed.emit())
	hint_button.pressed.connect(func(): ButtonEvents.on_hint_button_pressed.emit())

func set_menu_button_state(state:bool):
	_set_button_state(main_menu_button, state)

func set_hint_button_state(state:bool):
	_set_button_state(hint_button, state)

func _set_button_state(button:BaseButton, state:bool):
	button.visible = state
	button.disabled = !state

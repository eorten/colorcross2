class_name UI extends CanvasLayer

@export var bottom_bar:BottomBar
@export_group("Screens")
@export var main_menu_screen:Control
@export var play_menu_screen:Control
@export var play_screen:Control
@export var tutorial_screen:Control

var current_ui_state:UIState
var current_playscreen_state:PlayScreenState
func set_state(state:UIState):
	current_ui_state = state
	#Set active buttons
	bottom_bar.set_hint_button_state(state.is_see_board_button_active())
	bottom_bar.set_menu_button_state(state.is_main_menu_button_active())
	
	#Set active screen
	main_menu_screen.visible = state.get_active_screen() == state.Screens.MAIN_MENU
	play_menu_screen.visible = state.get_active_screen() == state.Screens.PLAY_MENU
	play_screen.visible = state.get_active_screen() == state.Screens.PLAY_SCREEN
	tutorial_screen.visible = state.get_active_screen() == state.Screens.TUTORIAL_SCREEN

func set_playscreen_state(state:PlayScreenState):
	current_playscreen_state = state
	play_screen.set_state(state)

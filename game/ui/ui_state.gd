class_name UIState extends RefCounted

#region bottom_bar
var _main_menu_button_active: bool
var _see_board_button_active: bool
#endregion

#region active screen
enum Screens { MAIN_MENU, PLAY_MENU, PLAY_SCREEN, TUTORIAL_SCREEN}
var _active_screen: Screens
#endregion

func _init(
		main_menu_button_active: bool = false,
		see_board_button_active: bool = false,
		active_screen: Screens = Screens.MAIN_MENU
	) -> void:
	_main_menu_button_active = main_menu_button_active
	_see_board_button_active = see_board_button_active
	_active_screen = active_screen

#region getters
func is_main_menu_button_active() -> bool:
	return _main_menu_button_active

func is_see_board_button_active() -> bool:
	return _see_board_button_active

func get_active_screen() -> Screens:
	return _active_screen
#endregion

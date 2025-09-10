extends Node
@onready var ui: UI = %UI

var _palette:Palette
var _board:Board
var _solution_board:Board
func _ready() -> void:

	#region Connect events
	ButtonEvents.on_play_menu_button_pressed.connect(func():
		ui.set_state(
			UIState.new(true, false, UIState.Screens.PLAY_MENU)
		)
	)
	
	ButtonEvents.on_main_menu_button_pressed.connect(func():
		ui.set_state(UIState.new())
	)
	
	ButtonEvents.on_play_button_pressed.connect(func(board_size:int):
		ui.set_state(
			UIState.new(true, true, UIState.Screens.PLAY_SCREEN)
		)
		#Set play screen state
		_start_game(board_size)
	)
	
	ButtonEvents.on_hint_button_pressed.connect(func():
		#if(ui.current_ui_state.get_active_screen() != UIState.Screens.PLAY_SCREEN): #MOVE TO ASSERT_PLAYING FUNC
			#print("UI in wrong state")
			#return
		
		var old_state := ui.current_playscreen_state as PlayScreenState
		ui.set_playscreen_state(
			PlayScreenState.new(old_state.move_counter, old_state.hint_counter, PlayScreenState.State.SOLUTION, _board, _solution_board)
		)
	)
	ButtonEvents.on_laser_button_pressed.connect(func():
		var old_state := ui.current_playscreen_state as PlayScreenState
		ui.set_playscreen_state(
			PlayScreenState.new(old_state.move_counter, old_state.hint_counter, PlayScreenState.State.COLOR_SELECTION, _board, _solution_board)
		)
	)
	#GameplayEvents.on_board_changed.connect(func(new_board):
		#_board = new_board
		#var old_state := ui.current_playscreen_state as PlayScreenState
		#ui.set_playscreen_state(
			#PlayScreenState.new(old_state.move_counter, old_state.hint_counter, PlayScreenState.State.SOLUTION, _board, _solution_board)
		#)
	#)
	#endregion
	
	#Set state
	ui.set_state(UIState.new())

func _start_game(board_size:int):
	_palette = Palette.new(board_size)
	
	_solution_board = Board.new(board_size, _palette) as Board
	_solution_board.scramble_lasers()
	_board = Board.new(board_size, _palette) as Board
	ui.set_playscreen_state(
		PlayScreenState.new(0, 0, PlayScreenState.State.PLAYING, _board, _solution_board)
	)

func _unhandled_input(event):
	if !event is InputEventScreenTouch: return;
	if(ui.current_ui_state.get_active_screen() != UIState.Screens.PLAY_SCREEN): return;
	if(ui.current_playscreen_state.state == PlayScreenState.State.SOLUTION):
	
		var old_state := ui.current_playscreen_state as PlayScreenState
		ui.set_playscreen_state(
			PlayScreenState.new(old_state.move_counter, old_state.hint_counter, PlayScreenState.State.PLAYING, _board, _solution_board)
		)
	elif ui.current_playscreen_state.state == PlayScreenState.State.COLOR_SELECTION:
		var old_state := ui.current_playscreen_state as PlayScreenState
		ui.set_playscreen_state(
			PlayScreenState.new(old_state.move_counter, old_state.hint_counter, PlayScreenState.State.PLAYING, _board, _solution_board)
		)

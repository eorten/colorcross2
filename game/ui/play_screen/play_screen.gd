class_name PlayScreen extends Node
@export var cell_prefab:PackedScene
@export var palette_entry_prefab:PackedScene
@export var laser_prefab:PackedScene

@onready var board: GridContainer = %Board
@onready var solution_board: PanelContainer = %SolutionBoard
@onready var solution_board_container: GridContainer = %SolutionBoardContainer
@onready var palette: PanelContainer = %Palette
@onready var palette_container: HBoxContainer = %PaletteContainer

@onready var board_size_label: Label = %BoardSizeLabel
@onready var move_counter_label: Label = %MoveCounterLabel
@onready var hint_counter_label: Label = %HintCounterLabel

func set_state(state:PlayScreenState):
	var board_size = state.board.get_board_size()
	#Text
	board_size_label.text = str(board_size) + "x" + str(board_size)
	move_counter_label.text = "Moves: " + str(state.move_counter)
	hint_counter_label.text = "Hints: " + str(state.hint_counter)
	
	#Remove old
	for child in board.get_children():
		child.queue_free()
	for child in solution_board_container.get_children():
		child.queue_free()
	for child in palette_container.get_children():
		child.queue_free()
		
	board.visible = false
	solution_board.visible = false
	palette.modulate = Color.TRANSPARENT
	
	#Create new 
	board.columns = board_size + 1 #+1 for laser
	solution_board_container.columns = board_size
	
	match state.state:
		PlayScreenState.State.PLAYING:
			board.visible = true
			_create_play_board(state)
		
		PlayScreenState.State.SOLUTION:
			solution_board.visible = true
			_create_solution_board(state)
			
		PlayScreenState.State.SOLVED:
			solution_board.visible = true
			_create_solution_board(state)
		
		PlayScreenState.State.COLOR_SELECTION:
			board.visible = true
			palette.modulate = Color.WHITE
			_create_play_board(state)
			for i in len(state.board.get_palette().get_intcolors()):
				var new_palette_entry = palette_entry_prefab.instantiate()
				new_palette_entry.modulate = state.board.get_palette().get_intcolor(i).get_color()
				new_palette_entry.pressed.connect(func(): 
					GameplayEvents.on_laser_change_color.emit(i)
				)
				palette_container.add_child(new_palette_entry)

func _create_play_board(state:PlayScreenState):
	var new_row_lasers = state.board.get_row_lasers()
	var new_col_lasers = state.board.get_col_lasers()
	var board_size = state.board.get_board_size()
	var new_board = state.board.get_board()
	
	for y in board_size:
		for x in board_size:
			var iter_pos = Vector2i(x,y)
			var new_cell = cell_prefab.instantiate()
			board.add_child(new_cell)
			new_cell.modulate = new_board[iter_pos].get_color()
		
		#Add row laser
		var laser_idx = y
		var new_laser = laser_prefab.instantiate()
		new_laser.set_rot(-90)
		new_laser.pressed.connect(func(): print("row idx ", str(y), " pressed");ButtonEvents.on_laser_button_pressed.emit(PlayScreenState.LaserOrientation.ROW, laser_idx)) #row, laser_idx
		board.add_child(new_laser)
		new_laser.set_color(new_row_lasers[laser_idx].get_color())
	
	#Add col lasers
	for x in state.board.get_board_size():
		var laser_idx = x
		var new_laser = laser_prefab.instantiate()
		new_laser.pressed.connect(func(): print("col idx ", str(x), " pressed"); ButtonEvents.on_laser_button_pressed.emit(PlayScreenState.LaserOrientation.COL, laser_idx))
		board.add_child(new_laser)
		new_laser.set_color(new_col_lasers[laser_idx].get_color())


	#GameplayEvents.on_col_laser_change_color.connect(func(color_idx):

func _create_solution_board(state:PlayScreenState):
	var board_size = state.solution_board.get_board_size()
	var new_board = state.solution_board.get_board()
	
	for y in board_size:
		for x in board_size:
			var iter_pos = Vector2i(x,y)
			var new_cell = cell_prefab.instantiate()
			solution_board_container.add_child(new_cell)
			new_cell.modulate = new_board[iter_pos].get_color()

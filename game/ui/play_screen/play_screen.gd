class_name PlayScreen extends Node
@export var cell_prefab:PackedScene
@export var laser_prefab:PackedScene

@onready var board: GridContainer = %Board
@onready var solution_board: PanelContainer = %SolutionBoard
@onready var solution_board_container: GridContainer = %SolutionBoardContainer
@onready var palette_container: PanelContainer = %PaletteContainer

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
	board.visible = false
	solution_board.visible = false
	palette_container.modulate = Color.TRANSPARENT
	
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
			palette_container.modulate = Color.WHITE
			_create_play_board(state)

func row_laser_clicked(idx):
	GameplayEvents.on_board_changed.emit()

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
		new_laser.pressed.connect(ButtonEvents.on_laser_button_pressed.emit)
		board.add_child(new_laser)
		new_laser.set_color(new_row_lasers[laser_idx].get_color())
	
	#Add col lasers
	for x in state.board.get_board_size():
		var new_laser = laser_prefab.instantiate()
		new_laser.pressed.connect(ButtonEvents.on_laser_button_pressed.emit)
		board.add_child(new_laser)
		new_laser.set_color(new_col_lasers[x].get_color())

func _create_solution_board(state:PlayScreenState):
	var board_size = state.solution_board.get_board_size()
	var new_board = state.solution_board.get_board()
	
	for y in board_size:
		for x in board_size:
			var iter_pos = Vector2i(x,y)
			var new_cell = cell_prefab.instantiate()
			solution_board_container.add_child(new_cell)
			new_cell.modulate = new_board[iter_pos].get_color()

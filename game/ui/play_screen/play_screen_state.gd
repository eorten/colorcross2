class_name PlayScreenState extends RefCounted

var move_counter: int
var hint_counter: int

enum State { PLAYING, COLOR_SELECTION, SOLUTION, SOLVED }
var state: State

var board: Board
var solution_board: Board

func _init(
		move_counter: int = 0,
		hint_counter: int = 0,
		state: State = State.PLAYING,
		board: Board = null,
		solution_board: Board = null
	) -> void:
	self.move_counter = move_counter
	self.hint_counter = hint_counter
	self.state = state
	self.board = board
	self.solution_board = solution_board

class_name PlayScreenState extends RefCounted

var move_counter: int
var hint_counter: int

enum State { PLAYING, COLOR_SELECTION, SOLUTION, SOLVED }
enum LaserOrientation {ROW, COL}
var state: State

var board: Board
var solution_board: Board

var active_laser_idx:int
var active_laser_orientation:LaserOrientation

func _init(
		move_counter: int = 0,
		hint_counter: int = 0,
		state: State = State.PLAYING,
		board: Board = null,
		solution_board: Board = null,
		active_laser_idx:int = -1,
		active_laser_orientation:LaserOrientation = -1
	) -> void:
	self.move_counter = move_counter
	self.hint_counter = hint_counter
	self.state = state
	self.board = board
	self.solution_board = solution_board
	self.active_laser_idx = active_laser_idx
	self.active_laser_orientation = active_laser_orientation

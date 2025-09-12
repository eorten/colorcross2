class_name Board extends RefCounted

var _palette:Palette
var _board_size:int
var _board:Dictionary[Vector2i, Cell]
var _row_lasers:Array[Laser]
var _col_lasers:Array[Laser]
func _init(board_size:int, palette:Palette) -> void:
	_palette = palette
	_board_size = board_size
	_board = {} as Dictionary[Vector2i, Cell]
	for y in board_size:
		_row_lasers.append(Laser.new(_palette, -1))
		_col_lasers.append(Laser.new(_palette, -1))
		for x in board_size:
			_board[Vector2i(x,y)] = Cell.new()

func scramble_lasers():
	for laser:Laser in _row_lasers:
		laser.set_color_idx(randi_range(0, _palette.get_size()-1))
	
	for laser:Laser in _col_lasers:
		laser.set_color_idx(randi_range(0, _palette.get_size()-1))

	_update_cells()

func set_row_laser_color_index(laser_idx:int, new_color_index:int):
	_row_lasers[laser_idx].set_color_idx(new_color_index)
	_update_cells()

func set_col_laser_color_index(laser_idx:int, new_color_index:int):
	_col_lasers[laser_idx].set_color_idx(new_color_index)
	_update_cells()
	

func _update_cells():
	for pos in _board.keys():
		var row_laser = _row_lasers[pos.y] as Laser
		var col_laser = _col_lasers[pos.x] as Laser
		_board[pos].update_color(row_laser.get_intcolor(), col_laser.get_intcolor())

func get_palette() -> Palette:
	return _palette
func get_board_size() -> int:
	return _board_size
func get_board() -> Dictionary[Vector2i, Cell]:
	return _board
func get_row_lasers() -> Array[Laser]:
	return _row_lasers
func get_col_lasers() -> Array[Laser]:
	return _col_lasers

static func equals(b1:Board, b2:Board):
	if b1.get_board_size() != b2.get_board_size(): return false;
	for x in b1.get_board_size():
		for y in b1.get_board_size():
			var iter_pos = Vector2i(x,y)
			var c1_color:IntColor = b1.get_board()[iter_pos].get_intcolor()
			var c2_color:IntColor = b2.get_board()[iter_pos].get_intcolor()
			if ! IntColor.equals(c1_color, c2_color): return false;
	return true
			

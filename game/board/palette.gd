class_name Palette extends RefCounted
#const BASE_COLOR = Color.from_ok_hsl(0, .7, .5)
const SATURATION := .7 as float
const LIGHTNESS := .5 as float
var _colors:Array[IntColor]
var _size:int
func _init(size:int) -> void:
	_size = size
	var step := 1.0/(float(size)+1.0) as float
	var hue := 0 as float
	for x in size:
		var new_color := Color.from_ok_hsl(hue, SATURATION, LIGHTNESS) as Color
		var new_int_color := IntColor.new(new_color.r8, new_color.g8,new_color.b8) as IntColor
		_colors.append(new_int_color)
		hue += step

#func get_random_color() -> IntColor:
	#return _colors.pick_random()
func get_size():
	return _size
func get_intcolor(idx:int) -> IntColor:
	return _colors.get(idx)
func get_intcolors() -> Array[IntColor]:
	return _colors

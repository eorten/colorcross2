class_name Cell extends RefCounted

var _current_color:IntColor
func _init(new_color:IntColor = IntColor.new()) -> void:
	_current_color = new_color
	
func set_color(color:IntColor):
	_current_color = color
	
func update_color(c1:IntColor, c2:IntColor):
	_current_color = IntColor.mix(c1, c2)

func get_intcolor():
	return _current_color

func get_color():
	return _current_color.get_color()

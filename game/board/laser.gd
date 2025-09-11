class_name Laser extends RefCounted

var _palette:Palette
var _palette_idx:int
func _init(palette:Palette, palette_idx:int) -> void:
	_palette = palette
	_palette_idx = palette_idx

func set_color_idx(idx:int):
	_palette_idx = idx

func get_intcolor() -> IntColor:
	if _palette_idx == -1: return IntColor.new();
	return _palette.get_intcolor(_palette_idx)
	
func get_color() -> Color:
	return get_intcolor().get_color()

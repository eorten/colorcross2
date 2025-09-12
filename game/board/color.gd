class_name IntColor extends RefCounted

var r:int
var g:int
var b:int
func _init(r:int = 0, g:int = 0, b:int = 0) -> void:
	self.r = r
	self.g = g
	self.b = b
	
func get_color() -> Color:
	return Color8(r, g, b)

func _to_string() -> String:
	return str(r) + ", " + str(g) + ", " + str(b) + ", "

static func mix(c1:IntColor, c2:IntColor):
	var res_r = floor(c1.r/2) as int
	var res_g = floor(c1.g/2) as int
	var res_b = floor(c1.b/2) as int
	
	res_r += floor(c2.r/2) as int
	res_g += floor(c2.g/2) as int
	res_b += floor(c2.b/2) as int
	
	return IntColor.new(res_r, res_g, res_b)
	
static func get_random_intcolor() -> IntColor:
	var iclr = IntColor.new()
	iclr.r = randi_range(0,255)
	iclr.g = randi_range(0,255)
	iclr.b = randi_range(0,255)
	return iclr

static func equals(c1:IntColor, c2:IntColor):
	return c1.r == c2.r && c1.g == c2.g && c1.b == c2.b

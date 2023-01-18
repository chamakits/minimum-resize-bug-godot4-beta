extends Node2D

var max_viewport_position: Vector2

func _ready():
	print("window size ON START READY: ", DisplayServer.window_get_size())
	# SEE ME: Uncommenting this will set the max size correctly, and the window will look good.
#	_disable_window_scale()
	_setup_viewport()
	_set_window_scales()
	print("Ready sub node.")
	print("window size ON END READY: ", DisplayServer.window_get_size())

func _input(event: InputEvent):
	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()

func _setup_viewport():
	max_viewport_position = get_viewport_rect().size

# Start window scaling functions
var original_window_size: Vector2i
var window_scale: int = 7
const SCALE_ENABLED = false
func _set_window_scales():
	original_window_size = DisplayServer.window_get_size()
	print("original_window_size: ", original_window_size)
	_set_window_scale(window_scale)
	if !SCALE_ENABLED:
		_disable_window_scale()

func _disable_window_scale():
	print("_disable_window_scale")
	print("DisplayServer.window_get_size()", DisplayServer.window_get_size())
	DisplayServer.window_set_max_size(DisplayServer.window_get_size())
	DisplayServer.window_set_min_size(DisplayServer.window_get_size())

func _set_window_scale(window_scale_in:int):
	print("window size BEFORE set:", DisplayServer.window_get_size())
	DisplayServer.window_set_size(original_window_size * window_scale_in)
	print("window size AFTER set:", DisplayServer.window_get_size())
# End window scaling functions

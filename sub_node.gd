extends Node2D

var max_viewport_position: Vector2

func _ready():
	_setup_viewport()
	_set_window_scales()
	print("Ready sub node.")

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
	_set_window_scale(window_scale)
	if !SCALE_ENABLED:
		_disable_window_scale()

func _disable_window_scale():
	DisplayServer.window_set_max_size(DisplayServer.window_get_size())
	DisplayServer.window_set_min_size(DisplayServer.window_get_size())

func _set_window_scale(window_scale_in:int):
	DisplayServer.window_set_size(original_window_size * window_scale_in)
# End window scaling functions

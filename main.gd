extends Node3D

@onready var xr_origin_3d = $XROrigin3D
var tracker_scene = preload("res://tracker.tscn")
var xr_interface: XRInterface

func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		get_viewport().use_xr = true
		get_viewport().transparent_bg = true
		xr_interface.start_passthrough()
		if xr_interface is OpenXRInterface:
			Engine.physics_ticks_per_second = xr_interface.display_refresh_rate

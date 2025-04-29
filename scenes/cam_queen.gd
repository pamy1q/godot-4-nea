extends Camera2D
@export var zoom_speed : float =1.0
@export var min_zoom : float = 0.3
@export var max_zoom : float = 1.5

func _process(delta:float)-> void:
		if Input.is_action_pressed("ui_up"):
			zoom += Vector2(zoom_speed, zoom_speed) * delta
		zoom.x = clamp(zoom.x,min_zoom, max_zoom)
		zoom.y = clamp(zoom.y,min_zoom, max_zoom)

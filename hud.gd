extends Control
class_name HUD
@onready var lap_time: Label = $LapTime
@onready var laps: Label = $Laps

var elapsed_time : float = 0.0
var running: bool = false
func _process(delta: float) -> void:
	if not running:
		if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_up") or ("ui_down"):
			running = true
	if running:
		elapsed_time += delta
		lap_time.text = format_time(elapsed_time)



func format_time(time_seconds: float) -> String:
		var mins: int = int(time_seconds / 60) 
		var secs: int = int(fmod(time_seconds, 60))
		var milli: int = int(fmod(time_seconds, 1.0) * 1000)
		return "%02d : %02d: %03d" % [mins, secs, milli]
		
func update_lap_text(current_lap:int, total_laps:int)-> void:
	laps.text ="Lap %d/%d" % [current_lap,total_laps]

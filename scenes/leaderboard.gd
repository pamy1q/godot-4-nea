extends Control
@onready var v_box_container: VBoxContainer = $VBoxContainer

func _ready():
	var leaderboard = SaveManager.data.get("leaderboard",[])
	
	if leaderboard.is_empty():
		var label = Label.new()
		label.text = "No scores yet!"
		v_box_container.add_child(label)
		return
	leaderboard.sort_custom(func(a, b): return a["time"] < b["time"])
	
	for entry in leaderboard.slice(0, min(5,leaderboard.size())):
		var label = Label.new()
		label.text = "%s - %s" % [entry["username"], format_time(entry["time"])]
		v_box_container.add_child(label)
		
func format_time(seconds: float) -> String:
		var mins: int = int(seconds / 60) 
		var secs: int = int(fmod(seconds, 60))
		var milli: int = int(fmod(seconds, 1.0) * 1000)
		return "%02d : %02d: %03d" % [mins, secs, milli]

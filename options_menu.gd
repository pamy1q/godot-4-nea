extends Control


# Called when the node enters the scene tree for the first time.
@onready var volume_slider = $MarginContainer/VBoxContainer/Volume
func _ready():
	var music_player = get_node("/root/Main/AudioStreamPlayer") #absolute paths to access the audiostream player from Main MENU
	volume_slider.value = db_to_linear(music_player.volume_db) * 100
	volume_slider.connect("value_changed", _on_slider_value_changed.bind(music_player))
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_slider_value_changed(value,music_player) :
	music_player.volume_db = linear_to_db(value / 100)
	

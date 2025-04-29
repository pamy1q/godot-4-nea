extends Node


@onready var music_player = $AudioStreamPlayer #finds the audio node in the same  scene

func _ready():
	music_player.play()

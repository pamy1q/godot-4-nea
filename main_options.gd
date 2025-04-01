extends Control


# Called when the node enters the scene tree for the first time.
@onready var options_menu_scene = preload("res://options_menu.tscn")
func _on_options_button_pressed():
	var options_menu = options_menu_scene.instantiate()
	add_child(options_menu)# opens the options when function called .

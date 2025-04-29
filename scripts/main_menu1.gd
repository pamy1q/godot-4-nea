class_name MainMenu #MainMenu turned to global class that can be used in other scripts
extends Control
#UI Node references
@onready var start_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/Start_Button as Button
@onready var options_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/Options_Button as Button
@onready var exit_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_Button as Button
@onready var options_menu: OptionsMenu = $Options_Menu as OptionsMenu
@onready var margin_container: MarginContainer = $MarginContainer as MarginContainer
@onready var start_user = preload("res://scenes/test_name.tscn") as PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	handle_connecting_signals() # Method that connects signals to their handlers Placeholder for the start button functionality	

func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_user)
	print("startpressed") # Replace with function b

	
func on_options_pressed() -> void:
	margin_container.visible = false # Method  boolean that ensures options menu frame is visible
	options_menu.set_process(true)#Method that boolean delays Godot from allowing input events until the options is closed 
	options_menu.visible = true # Method that disables the main menu, prevents interaction conf
func on_exit_pressed() -> void:
	get_tree().quit()
	
func on_exit_options_menu()-> void:
	margin_container.visible = true
	options_menu.visible = false
	
func handle_connecting_signals()-> void:
	start_button.button_down.connect(on_start_pressed)# Method that connects the options button to the options menu
	options_button.button_down.connect(on_options_pressed)
	exit_button.button_down.connect(on_exit_pressed)
	options_menu.exit_options_menu.connect(on_exit_options_menu)# Method that connects signal from options menu to return to main menu  # Method connects exit button to quit game

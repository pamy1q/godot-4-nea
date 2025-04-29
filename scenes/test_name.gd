extends Control

@onready var line_edit: LineEdit = $MarginContainer/Label/CenterContainer/LineEdit


func on_enter_button_pressed():
	var username = line_edit.text
	if username != "":
		SaveManager.set_username(username)
		print("Saved username: ", username)
		get_tree().change_scene_to_file("res://characterSelection.tscn")

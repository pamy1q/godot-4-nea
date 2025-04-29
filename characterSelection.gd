extends Control


func _on_rook_pressed() -> void:
	Global.selected_character = "res://scenes/rook_car.tscn"
	get_tree().change_scene_to_file("res://scenes/map.tscn")




func _on_queen_pressed() -> void:
	Global.selected_character = "res://scenes/queen_car.tscn"
	get_tree().change_scene_to_file("res://scenes/map.tscn")

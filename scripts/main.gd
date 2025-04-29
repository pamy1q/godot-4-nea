extends Node2D
@onready var player_spawn: Marker2D = $PlayerSpawn
@onready var hud = $CanvasLayer/HUD
var lap_count: int = 0
var max_laps: int = 2
var raceStarted:bool = false
var race_finished:bool = false

func _on_lap_line_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and  not race_finished:
			if not raceStarted:
				raceStarted = true
				print("Race begin but ignore first line")
				return
			lap_count+=1
			hud.update_lap_text(lap_count, max_laps)
			
			if lap_count >= max_laps:
				race_finished = true
				hud.running = false
				Global.final_time = hud.elapsed_time
				var player_name = SaveManager.get_username()
				var finish_line = Global.final_time
				
				if not SaveManager.data.has("leaderboard"):
					SaveManager.data["leaderboard"] =[]
				SaveManager.data["leaderboard"].append({
					"username":SaveManager.get_username(),
					"time": Global.final_time
				})
				SaveManager.write_save()
				print("Finished!")
				await get_tree().create_timer(2).timeout
				get_tree().change_scene_to_file("res://scenes/Leaderboard.tscn") 
func _ready():
	var character_path = Global.selected_character
	if character_path == "":
		print("ERROOR,no character")
		return
		
	var scene = load(character_path)
	if scene != null and scene is PackedScene:
		var  kart_instance = scene.instantiate()
		kart_instance.position = $PlayerSpawn.position
		add_child(kart_instance)
	else:
		print("selected path is wrong path")

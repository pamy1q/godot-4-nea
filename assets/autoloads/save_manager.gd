extends Node
var json = JSON.new()
const PATH = "user://data.json"

var data : Dictionary = {}

func _ready():
	if  FileAccess.file_exists(PATH):
		data = read_save()
	else:
		data = {
		"username": "",
		"leaderboard":[]
		}
		write_save(data)
		
	

func set_username(username: String):
	data["username"] = username
	write_save(data)

func get_username()-> String:
	return data.get("username", "")
	
func write_save(content:= data):
	var file = FileAccess.open(PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(content))
	file.close()
	file = null
func read_save()->Dictionary:
	var file = FileAccess.open(PATH, FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	file.close()
	if typeof(content)== TYPE_DICTIONARY:
		return content
	else:
		return{}



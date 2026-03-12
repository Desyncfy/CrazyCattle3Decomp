extends Node3D

var sheep = preload("res://sheep.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("http://" + Global.savedip + ":42024/npcs")
	$HTTPRequest.request("http://" + Global.savedip + ":42024/npcs")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_http_request_request_completed(_result: int, _response_code: int, _headers: PackedStringArray, body: PackedByteArray) -> void:
	var sheep_postitions = JSON.parse_string(body.get_string_from_utf8())
	for i in sheep_postitions:
		var new_sheep = sheep.instantiate()
		add_child(Camera3D.new())
		new_sheep.global_position = Vector3(sheep_postitions[i][0], sheep_postitions[i][1], sheep_postitions[i][2])

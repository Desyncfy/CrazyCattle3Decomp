extends Node2D

# Used for cheat button
func saveprogress():
	var data = SaveData.new()
	data.saveunlockedlevels = Global.unlockedlevels
	data.beatenlevels = Global.beatenlevels
	data.savename = Global.playername
	data.mastervol = AudioServer.get_bus_volume_db(0)
	data.musicvol = AudioServer.get_bus_volume_db(1)
	if DisplayServer.window_get_mode() == (DisplayServer.WINDOW_MODE_FULLSCREEN):
		data.fullscreen = true
	else:
		data.fullscreen = false
	print("Saved")
	ResourceSaver.save(data, "user://savefile.tres")

func updateUnlocks():
	if Global.unlockedlevels >= 1:
		$Worldmap / ire.disabled = false
		if Global.unlockedlevels >= 2:
			$Worldmap / egy.disabled = false
			if Global.unlockedlevels >= 3:
				$Worldmap / swe.disabled = false
				if Global.unlockedlevels >= 4:
					$Worldmap / env.disabled = false

func updateUIticks():
	if Global.beatenlevels >= 1:
		$Worldmap / Yes.show()
		if Global.beatenlevels >= 2:
			$Worldmap / Yes2.show()
			if Global.beatenlevels >= 3:
					$Worldmap / Yes3.show()
					if Global.beatenlevels >= 4:
						$Worldmap / Yes4.show()

func _on_swe_pressed() -> void :
	$Worldmap / Uirelease.play()
	get_tree().change_scene_to_file("res://sweden.tscn")

func _on_ire_pressed() -> void :
	$Worldmap / Uirelease.play()
	get_tree().change_scene_to_file("res://environment2.tscn")


func _on_egy_pressed() -> void :
	$Worldmap / Uirelease.play()
	get_tree().change_scene_to_file("res://egypt.tscn")

func _on_return_pressed() -> void :
	$Worldmap / Uirelease.play()
	get_tree().change_scene_to_file("res://menu.tscn")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	updateUnlocks()
	updateUIticks()

func _on_return_2_pressed() -> void :
	$Worldmap / Uirelease.play()
	get_tree().change_scene_to_file("res://trophyroom.tscn")


func _on_swe_button_down() -> void :
	$Worldmap / Uipress.play()


func _on_ire_button_down() -> void :
	$Worldmap / Uipress.play()


func _on_egy_button_down() -> void :
	$Worldmap / Uipress.play()


func _on_return_button_down() -> void :
	$Worldmap / Uipress.play()


func _on_return_2_button_down() -> void :
	$Worldmap / Uipress.play()



func _on_swe_mouse_entered() -> void :
	if $Worldmap / swe.disabled == false:
		$Worldmap / Uihover.play()


func _on_ire_mouse_entered() -> void :
	if $Worldmap / ire.disabled == false:
		$Worldmap / Uihover.play()


func _on_egy_mouse_entered() -> void :
	if $Worldmap / egy.disabled == false:
		$Worldmap / Uihover.play()


func _on_return_mouse_entered() -> void :
	$Worldmap / Uihover.play()

func _on_return_2_mouse_entered() -> void :
	$Worldmap / Uihover.play()


func _on_env_button_down() -> void:
	$Worldmap / Uipress.play()


func _on_env_pressed() -> void:
	$Worldmap / Uirelease.play()
	get_tree().change_scene_to_file("res://environment.tscn")


func _on_env_mouse_entered() -> void:
	$Worldmap / Uihover.play()


func _on_cheat_button_down() -> void:
	$Worldmap / Uipress.play()


func _on_cheat_pressed() -> void:
	$Worldmap / Uirelease.play()
	Global.unlockedlevels = 4
	Global.beatenlevels = 5
	saveprogress()


func _on_cheat_mouse_entered() -> void:
	$Worldmap / Uihover.play()

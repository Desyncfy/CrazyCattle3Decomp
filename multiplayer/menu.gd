extends Node


@onready var data = ResourceLoader.load("user://savefile.tres") as SaveData

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$IP.text = data.savedip

func uiHover():
	$Uihover.play()

func uiPress():
	$Uipress.play()

func uiRelease():
	$Uirelease.play()


func _on_back_button_down() -> void:
	uiPress()


func _on_back_button_up() -> void:
	uiRelease()


func _on_back_pressed() -> void:
	$Baa.play()
	if $IP.text:
		# Sneakily save IP for next game open
		data.savedip = $IP.text
		ResourceSaver.save(data, "user://savefile.tres")
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_back_focus_entered() -> void:
	uiHover()


func _on_connect_focus_entered() -> void:
	uiHover()


func _on_connect_button_down() -> void:
	uiPress()


func _on_connect_button_up() -> void:
	uiRelease()


func _on_connect_pressed() -> void:
	if $IP.text:
		# Sneakily save IP for next game open
		data.savedip = $IP.text
		ResourceSaver.save(data, "user://savefile.tres")

		get_tree().change_scene_to_file("res://multiplayer/map_ir.tscn")

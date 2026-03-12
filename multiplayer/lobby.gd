extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func uiHover():
	$Uihover.play()

func uiPress():
	$Uipress.play()

func uiRelease():
	$Uirelease.play()

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://multiplayer/multiplayer.tscn")


func _on_back_button_down() -> void:
	uiPress()


func _on_back_button_up() -> void:
	uiRelease()


func _on_back_focus_entered() -> void:
	uiHover()

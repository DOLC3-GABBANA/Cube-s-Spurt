extends Control

var is_paused = false setget set_paused
onready var camera_pos = get_parent().get_node("Camera2D")

func _physics_process(delta):
	set_position(Vector2(camera_pos.position.x - 57, camera_pos.position.y))

func _ready():
	$Control/ColorMainMenuButton.modulate = globals.color
	$Control/ColorRestartButton.modulate = globals.color
	$Control/ColorResumeButton.modulate = globals.color

func set_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = value

func _unhandled_input(event):
	if event.is_action_pressed("set_pasue"):
		set_paused(!is_paused)

func _on_Resume_pressed():
	set_paused(false)

func _on_Restart_pressed():
	globals.level_attempts += 1
	get_tree().reload_current_scene()
	set_paused(false)

func _on_MainMenu_pressed():
	get_tree().change_scene("res://Objects/Menu/MainMenu.tscn")
	set_paused(false)

func _on_Qiut_pressed():
	get_tree().quit()

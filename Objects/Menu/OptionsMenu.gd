extends Control

var defaultColor = Color(0, 0, 1)
var buttonMenuPressed = true
var buttonGamePressed = true

func _ready():
	$Textures/Background.modulate = globals.color
	if globals.color == Color(0, 1, 0):
		$Buttons/GameMusicScrollBar.modulate = globals.color
		$Buttons/MenuMusicScrollBar.modulate = globals.color
	else:
		$Buttons/GameMusicScrollBar.modulate = defaultColor
		$Buttons/MenuMusicScrollBar.modulate = defaultColor
	$Buttons/MenuMusicScrollBar.value = globals.volumeMenu
	$Buttons/GameMusicScrollBar.value = globals.volumeGame
	if data_handling.load_data("button_menu.dat"):
		buttonMenuPressed = bool(int(data_handling.load_data("button_menu.dat")))
	if data_handling.load_data("button_game.dat"):
		buttonGamePressed = bool(int(data_handling.load_data("button_game.dat")))
	$Buttons/MenuMusicCheckButton.pressed = buttonMenuPressed
	$Buttons/GameMusicCheckButton.pressed = buttonGamePressed

func _process(delta):
	if $Buttons/MenuMusicCheckButton.pressed:
		$Buttons/MenuMusicScrollBar.visible = true
		buttonMenuPressed = true
		data_handling.save_data("1", "button_menu.dat")
	else:
		$Buttons/MenuMusicScrollBar.visible = false
		globals.volumeMenu = -80
		data_handling.save_data(globals.volumeMenu, "volume_menu.dat")
		buttonMenuPressed = false
		data_handling.save_data("0", "button_menu.dat")
	if $Buttons/GameMusicCheckButton.pressed:
		$Buttons/GameMusicScrollBar.visible = true
		buttonGamePressed = true
		data_handling.save_data("1", "button_game.dat")
	else:
		$Buttons/GameMusicScrollBar.visible = false
		globals.volumeGame = -80
		data_handling.save_data(globals.volumeGame, "volume_game.dat")
		buttonGamePressed = false
		data_handling.save_data("0", "button_game.dat")

func _on_MenuMusicScrollBar_value_changed(value):
	globals.volumeMenu = value
	data_handling.save_data(globals.volumeMenu, "volume_menu.dat")

func _on_GameMusicScrollBar_value_changed(value):
	globals.volumeGame = value
	data_handling.save_data(globals.volumeGame, "volume_game.dat")

func _on_Back_pressed():
	get_tree().reload_current_scene()

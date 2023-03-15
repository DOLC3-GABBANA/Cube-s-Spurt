extends Control

func _ready():
	if data_handling.load_data(globals.login +  "_attempt.dat"):
		$Panel/AllAttempt.text = "YOUR ALL ATTEMPTS: " + String(data_handling.load_data(globals.login + "_attempt.dat"))
	else:
		$Panel/AllAttempt.text = "YOUR ALL ATTEMPTS: " + String(globals.level_attempts)
	if data_handling.load_data(globals.login + "_time.dat"):
		$Panel/AllTime.text = "YOUR ALL TIME: " + String(int(data_handling.load_data(globals.login + "_time.dat")))
	else:
		$Panel/AllTime.text = "YOUR ALL TIME: " + String(int(globals.timer))
	if data_handling.load_data("coins.dat"):
		$Panel/Coins.text = "YOUR COINS: " + String(data_handling.load_data("coins.dat"))
	else:
		$Panel/Coins.text = "YOUR COINS: " + String(globals.coins)
	$Panel/Attempt.text = "YOUR ATTEMPTS OF THE CURRENT GAME: " + String(globals.level_attempts)
	$Panel/Time.text = "YOUR TIME OF THE CURRENT GAME: " + String(int(globals.timer))
	$Background.modulate = globals.color
	$Textures/ColorMainMenuButton.modulate = globals.color
	$Textures/ColorNextLevelButton.modulate = globals.color
	$Textures/ColorRestartButton.modulate = globals.color

func _on_ButtonRestartMenu_pressed():
	globals.level_attempts += 1
	get_tree().change_scene("res://Objects/Level/LevelBase.tscn")

func _on_ButtonMainMenu_pressed():
	get_tree().change_scene("res://Objects/Menu/MainMenu.tscn")
	
func _on_ButtonNextLevel_pressed():
	get_tree().change_scene("res://Objects/Level/LevelBase2.tscn")

func _on_Exit_pressed():
	get_tree().quit()

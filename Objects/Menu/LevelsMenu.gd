extends Control

func _ready():
	$Background.modulate = globals.color
	$Texteres/ColorLvl1Button.modulate = globals.color
	$Texteres/ColorLvl2Button.modulate = globals.color
	$Texteres/ColorLvl3Button.modulate = globals.color
	$Buttons/ButtonLvl2.disabled = globals.buttonDisable

func _on_ButtonLvl1_pressed():
	get_tree().change_scene("res://Objects/Level/LevelBase.tscn")

func _on_ButtonLvl2_pressed():
	get_tree().change_scene("res://Objects/Level/LevelBase2.tscn")

func _on_Back_pressed():
	hide()

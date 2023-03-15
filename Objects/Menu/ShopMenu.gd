extends Control

var icon1 = load("res://gfx/icons/icon_1.png")
var icon2 = load("res://gfx/icons/icon_2.png")
var icon3 = load("res://gfx/icons/icon_3.png")
var bgGreen = load("res://gfx/clouds/background_green.png")
var bgBlue = load("res://gfx/clouds/background_blue.png")

func _ready():
	$Texture/Background.modulate = globals.color
	$Buttons/ButtonsBuyBackgrounds/TextureBackground2.modulate = globals.color
	if data_handling.load_data("coins.dat"):
		$Coins.text = String(data_handling.load_data("coins.dat"))
	else:
		$Coins.text = '0'
	if globals.coins >= 5:
		$Buttons/ButtonsBuyHero/Hero1.disabled = false
		$Buttons/ButtonsBuyHero/Hero1.text = "HERO 1"
		$Buttons/Lables/Label1.visible = false
		$Buttons/Lables/Sprite1.visible = false
	if globals.coins >= 20:
		$Buttons/ButtonsBuyHero/Hero2.text = "HERO 2"
		$Buttons/ButtonsBuyHero/Hero2.disabled = false
		$Buttons/Lables/Label2.visible = false
		$Buttons/Lables/Sprite2.visible = false
	if globals.coins >= 30:
		$Buttons/ButtonsBuyHero/Hero3.text = "HERO 3"
		$Buttons/ButtonsBuyHero/Hero3.disabled = false
		$Buttons/Lables/Label3.visible = false
		$Buttons/Lables/Sprite3.visible = false
	if globals.coins >= 50:
		$Buttons/ButtonsBuyBackgrounds/Background1.disabled = false
		$Buttons/Lables/Label4.text = "Green Background"
		$Buttons/Lables/Label4.rect_position.x += 23
		$Buttons/Lables/Sprite4.visible = false
		$Buttons/ButtonsBuyBackgrounds/TextureBackground2.visible = true
		$Buttons/ButtonsBuyBackgrounds/Background2.visible = true

func _on_Hero1_pressed():
	globals.icon = icon1
	data_handling.save_data("res://gfx/icons/icon_1.png", "icon.dat")

func _on_Hero2_pressed():
	globals.icon = icon2
	data_handling.save_data("res://gfx/icons/icon_2.png", "icon.dat")

func _on_Hero3_pressed():
	globals.icon = icon3
	data_handling.save_data("res://gfx/icons/icon_3.png", "icon.dat")

func _on_Background1_pressed():
	var color = Color(0, 1, 0)
	globals.color = color
	globals.bg = bgGreen
	data_handling.save_data(color, "color.dat")
	data_handling.save_data("res://gfx/clouds/background_green.png", "bg.dat")

func _on_Background2_pressed():
	var color = Color(1, 1, 1)
	globals.color = color
	globals.bg = bgBlue
	data_handling.save_data(color, "color.dat")
	data_handling.save_data("res://gfx/clouds/background_blue.png", "bg.dat")

func _on_Back_pressed():
	get_tree().reload_current_scene()

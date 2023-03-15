extends Node

export(int) var level_attempts = 1
export(int) var timer = 0
export(int) var coins = 0
var menuMusic = "res://bgm/menuMusic.mp3"
var gameMusic = load("res://bgm/Life-Is-Still-Awes.mp3")
var icon = load("res://gfx/icons/Icon_default.png")
var bg = load("res://gfx/clouds/background_blue.png")
var color = Color(1, 1, 1)
var volumeMenu = -10
var volumeGame = -15
var buttonDisable = false
var login = ""
var password = ""

func _ready():
	if data_handling.load_data("icon.dat"):
		icon = load(data_handling.load_data("icon.dat"))
	if data_handling.load_data("coins.dat"):
		coins = int(data_handling.load_data("coins.dat"))
	if data_handling.load_data("color.dat"):
		color = data_handling.load_data("color.dat")
	if data_handling.load_data("bg.dat"):
		bg = load(data_handling.load_data("bg.dat"))
	if data_handling.load_data("volume_menu.dat"):
		volumeMenu = int(data_handling.load_data("volume_menu.dat"))
	if data_handling.load_data("volume_game.dat"):
		volumeGame = int(data_handling.load_data("volume_game.dat"))
	if data_handling.load_data("button_active.dat"):
		buttonDisable = bool(int(data_handling.load_data("button_active.dat")))

const PREV = 'previous'
const NEXT = 'next'

const GRAVITY = Vector2(0, 1200)
const UP = Vector2(0, -1)

const GROUP_TILES = "tiles"

const RAY_LEN = 8

func modulo(num, mod):
	return num - mod * floor(num / mod)

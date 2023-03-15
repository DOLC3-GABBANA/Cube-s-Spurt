extends Node2D

const ATTEMPT = "Attempt "
const TIME = " sec"

func stop_music():
	$music.stop()

func _ready():
	globals.timer = 0
	$Hero.connect("died", self, "_on_hero_die")
	$Hero.connect("die_timer", self, "_on_hero_die_timer")
	$Attempt.text = ATTEMPT + String(globals.level_attempts)
	$Tiles/neon.modulate = globals.color
	$Background/Background1.texture = globals.bg
	$Background/Background2.texture = globals.bg
	$Background/Background3.texture = globals.bg
	$Background/Background4.texture = globals.bg
	$Background/Background5.texture = globals.bg
	$Triggers/TriggerColor/TriggerColor10.color_modulate = globals.color
	$Triggers/TriggerColor/TriggerColor10.color_modulate = globals.color
	$Obstacles.modulate = globals.color
	$music.volume_db = globals.volumeGame

func _process(delta):
	globals.timer += delta
	$Timer.text = String(int(globals.timer)) + TIME

func _physics_process(delta):
	$Shades.position = $Hero.position

func _on_hero_die():
	stop_music()
	globals.level_attempts += 1
	if data_handling.load_data(globals.login + "_attempt.dat"):
		data_handling.save_data(int(data_handling.load_data(globals.login +  "_attempt.dat")) + 1, globals.login +  "_attempt.dat")
	else:
		data_handling.save_data(globals.level_attempts, globals.login + "_attempt.dat")
	if data_handling.load_data(globals.login + "_time.dat"):
		data_handling.save_data(int(data_handling.load_data(globals.login + "_time.dat")) + globals.timer, globals.login + "_time.dat")
	else:
		data_handling.save_data(int(globals.timer), globals.login + "_time.dat")

func _on_hero_die_timer():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()

extends Control

const ACCOUNT_LOGIN = "account_login_"
const ACCOUNT_PASSWORD = "account_password_"

var nextScene

func _process(delta):
	$AboutAccounts/CurrentAccount.text = "Current account: " + globals.login
	$AboutAccounts/AllTime.text = "Your game time: " + String(int(globals.timer))

func _ready():
	$BackgroundVideoPlayer.modulate = globals.color
	$Textures/NinePatchRect.texture = globals.bg
	$Textures/NinePatchRect2.texture = globals.bg
	$Textures/NinePatchRect3.texture = globals.bg
	$Textures/NinePatchRect4.texture = globals.bg
	$backgroundMusic.volume_db = globals.volumeMenu
	$Textures/ShadowButtonAccount.modulate = globals.color
	$Textures/ColorButtonAccount.modulate = globals.color
	$ChangeAccount/ShadowButtonAccount.modulate = globals.color
	$ChangeAccount/ColorButtonAccount.modulate = globals.color
	

func _on_ButtonPlay_pressed():
	if !globals.login:
		$Warnning.show()
	else:
		nextScene = load("res://Objects/Menu/LevelsMenu.tscn").instance()
		get_tree().current_scene.add_child(nextScene)

func _on_ButtonShop_pressed():
	if !globals.login:
		$Warnning.show()
	else:
		nextScene = load("res://Objects/Menu/ShopMenu.tscn").instance()
		get_tree().current_scene.add_child(nextScene)
	
func _on_ButtonOptions_pressed():
	if !globals.login:
		$Warnning.show()
	else:
		nextScene = load("res://Objects/Menu/OptionsMenu.tscn").instance()
		get_tree().current_scene.add_child(nextScene)

func _on_ButtonAccount_pressed():
	$ChangeAccount.show()

func _on_ButtonQuite_pressed():
	get_tree().quit()

func _on_ButtonRegister_pressed():
	data_handling.save_data(String($ChangeAccount/EnterLogin.text), ACCOUNT_LOGIN + String($ChangeAccount/EnterLogin.text))
	data_handling.save_data(String($ChangeAccount/EnterPassword.text), ACCOUNT_PASSWORD + String($ChangeAccount/EnterLogin.text))

func _on_ButtonLogin_pressed():
	if data_handling.load_data(ACCOUNT_LOGIN + $ChangeAccount/EnterLogin.text) && data_handling.load_data(ACCOUNT_PASSWORD + $ChangeAccount/EnterLogin.text):
		if data_handling.load_data(ACCOUNT_PASSWORD + $ChangeAccount/EnterLogin.text) == $ChangeAccount/EnterPassword.text:
			globals.login = $ChangeAccount/EnterLogin.text
			globals.password = $ChangeAccount/EnterPassword.text

func _on_Back_pressed():
	$ChangeAccount.hide()

func _on_OK_pressed():
	$Warnning.hide()

extends Node2D

export(NodePath) var target_path = null
var target

var new_camera_zoom = 0.5
var new_camera_rotate = 0

var is_child_node = false

func _ready():
	var temp_target = get_node(String(target_path) + "/Target")
	if not temp_target:
		target = get_node(target_path)
	else:
		is_child_node = true
		target = temp_target

	print(target)

	$icon.hide()

func _physics_process(delta):
	var target_position = target.position
	
	if is_child_node:
		target_position = target.position + target.get_parent().position

	position += (target_position - position + Vector2(64, 0)) * .5

	var current_zoom = $Camera2D.zoom[0]
	var new_zoom = lerp(current_zoom, new_camera_zoom, 0.05)
	$Camera2D.zoom = Vector2(new_zoom, new_zoom)

	var current_rotate = $Camera2D.rotation
	var new_rotate = lerp(current_rotate, new_camera_rotate, 0.1)
	$Camera2D.rotation = new_rotate

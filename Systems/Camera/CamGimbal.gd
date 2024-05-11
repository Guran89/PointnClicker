extends Node3D
@onready var player: CharacterBody3D = $"../PlayerAmy"
@onready var camera: Camera3D = $Camera

const MIN_ZOOM = 100.0  # Adjust this value based on desired minimum distance
const MAX_ZOOM = 800.0  # Adjust this value based on desired maximum distance

func _process(delta):
	position = player.position
	if Input.is_action_pressed("Left"):
		rotation.y -= 2.0 * delta
	if Input.is_action_pressed("Right"):
		rotation.y += 2.0 * delta

	if Input.is_action_pressed("Up") or Input.is_action_pressed("Down"):
		var zoom_change = Vector3(0, 200 * delta, 300 * delta)
		if Input.is_action_pressed("Up"):
			zoom_change = -zoom_change
		update_camera_zoom(zoom_change)

func update_camera_zoom(zoom_change):
	var new_pos = camera.position + zoom_change
	var dist = new_pos.distance_to(Vector3.ZERO)  # Assuming player is at Vector3.ZERO, adjust if not

	if dist > MAX_ZOOM or dist < MIN_ZOOM:
		return  # Do not apply the change if it would exceed bounds

	camera.position = new_pos


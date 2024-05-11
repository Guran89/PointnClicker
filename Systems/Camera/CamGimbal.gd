extends Node3D

func _process(delta):
	if Input.is_action_pressed("Left"):
		rotation.y -= 1.0 * delta
	if Input.is_action_pressed("Right"):
		rotation.y += 1.0 * delta

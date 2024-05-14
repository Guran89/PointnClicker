extends StaticBody3D

signal door_opened
signal door_closed

var door_open = false

func _ready():
	if not door_open:
		$Interactable.connect("interacted", _open_door)
	elif door_open:
		$Interactable.connect("interacted", _close_door)

func _open_door():
	$AnimationPlayer.play("open")
	emit_signal("door_opened")
	door_open = true

func _close_door():
	$AnimationPlayer.play_backwards("open")
	emit_signal("door_closed")
	door_open = false

func _on_interactable_interacted():
	pass

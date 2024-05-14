extends StaticBody3D

signal door_opened

func _ready():
	$Interactable.connect("interacted", _open_door)

func _open_door():
	$AnimationPlayer.play("open")
	emit_signal("door_opened")

func _on_interactable_interacted():
	pass

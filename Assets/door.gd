extends StaticBody3D

func _ready():
	$Interactable.connect("interacted", _open_door)

func _open_door():
	$AnimationPlayer.play("open")

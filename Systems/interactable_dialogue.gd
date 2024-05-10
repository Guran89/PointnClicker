extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

func _on_body_entered(_body):
	visible = true

func _on_body_exited(_body):
	visible = false

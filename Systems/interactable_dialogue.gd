extends Area3D
@onready var timer = $Timer

@export var id: String
var can_click = false

func _ready():
	visible = false

func _process(_delta):
	if can_click:
		print("You can click now")
		if Input.is_action_just_pressed("RightMouse"):
			print("You clicked on: " + id)

func _on_body_entered(_body):
	$AnimationPlayer.play("appear")
	visible = true

func _on_body_exited(_body):
	$AnimationPlayer.play("disappear")
	timer.start()

func _on_click_area_mouse_entered():
	print("Hello there")
	can_click = true

func _on_click_area_mouse_exited():
	can_click = false

func _on_timer_timeout():
	visible = false

extends Area3D

var old_texture = preload("res://Assets/interaction_symbol_circle.png")
var new_texture = preload("res://Assets/interaction_symbol_circle_hover.png")

@onready var timer = $Timer

@export var id: String

signal interacted

var can_click = false

func _ready():
	visible = false

func _process(_delta):
	if can_click:
		if Input.is_action_just_pressed("RightMouse"):
			print("You clicked on: " + id)
			emit_signal("interacted")
			$AnimationPlayer.play("disappear")
			timer.start()

func _on_body_entered(_body):
	$AnimationPlayer.play("appear")
	visible = true

func _on_body_exited(_body):
	$AnimationPlayer.play("disappear")

func _on_click_area_mouse_entered():
	can_click = true
	$InteractIcon.set_texture(new_texture)

func _on_click_area_mouse_exited():
	can_click = false
	$InteractIcon.set_texture(old_texture)

func _on_timer_timeout():
	queue_free()

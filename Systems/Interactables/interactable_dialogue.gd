extends Area3D
@onready var timer = $Timer

@export var id: String
@export var dialogueResource: DialogueResource
@export var dialogueTitle: String = "start"

const Balloon = preload("res://addons/dialogue_manager/example_balloon/example_balloon.tscn")

var can_click = false

func _ready():
	visible = false

func _process(_delta):
	if can_click:
		if Input.is_action_just_pressed("RightMouse"):
			print("You clicked on: " + id)
			var balloon: Node = Balloon.instantiate()
			get_tree().current_scene.add_child(balloon)
			balloon.start(dialogueResource, dialogueTitle)

func _on_body_entered(_body):
	$AnimationPlayer.play("appear")
	visible = true

func _on_body_exited(_body):
	$AnimationPlayer.play("disappear")
	timer.start()

func _on_click_area_mouse_entered():
	can_click = true

func _on_click_area_mouse_exited():
	can_click = false

func _on_timer_timeout():
	visible = false

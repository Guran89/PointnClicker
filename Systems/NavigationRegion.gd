extends NavigationRegion3D
@onready var timer = $Timer
@onready var navigation_link = $NavigationLink
@onready var room_2 = $Room2
@onready var animation_player = $Room2/AnimationPlayer

func _ready():
	navigation_link.enabled = false
	room_2.visible = false


func _on_door_door_opened():
	navigation_link.enabled = true
	timer.start()
	animation_player.play("appear")


func _on_timer_timeout():
	bake_navigation_mesh()
	print("NavLink activated.")

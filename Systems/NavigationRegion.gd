extends NavigationRegion3D
@onready var timer = $Timer
@onready var navigation_link = $NavigationLink

func _ready():
	navigation_link.enabled = false


func _on_door_door_opened():
	navigation_link.enabled = true
	timer.start()


func _on_timer_timeout():
	bake_navigation_mesh()
	print("NavLink activated.")

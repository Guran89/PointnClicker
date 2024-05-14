extends NavigationRegion3D
@onready var timer = $Timer
@onready var door_stopper = $DoorStopper

func _on_door_door_opened():
	door_stopper.queue_free()
	timer.start()



func _on_timer_timeout():
	bake_navigation_mesh()
	print("Done!")

extends CharacterBody3D
@onready var navigationAgent = $NavigationAgent3D
@onready var camera = $"../Camera3D"

const SPEED = 5
const ROTATION_SPEED = 5.0

func _process(delta):
	if navigationAgent.is_navigation_finished():
		return
	
	moveToPoint(delta, SPEED)

func moveToPoint(_delta, speed):
	var targetPos = navigationAgent.get_next_path_position()
	var direction = global_position.direction_to(targetPos)
	faceDirection(targetPos)
	velocity = direction * speed
	move_and_slide()

func faceDirection(_direction):
	rotation.y=lerp_angle(rotation.y,atan2(-velocity.x,-velocity.z),.1)

func _input(_event):
	if Input.is_action_just_pressed("LeftMouse"):
		var mousePos = get_viewport().get_mouse_position()
		var rayLength = 100
		var from = camera.project_ray_origin(mousePos)
		var to = from + camera.project_ray_normal(mousePos) * rayLength
		var space = get_world_3d().direct_space_state
		var rayQuery = PhysicsRayQueryParameters3D.new()
		rayQuery.from = from
		rayQuery.to = to
		rayQuery.collide_with_areas = true
		var result = space.intersect_ray(rayQuery)
		print(result)

		navigationAgent.target_position = result.position

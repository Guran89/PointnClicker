extends CharacterBody3D
@onready var navigationAgent = $NavigationAgent3D
@onready var animation_tree = $AnimationTree
@onready var animation_player = $AnimationPlayer

@onready var camera: Camera3D = $"../CamGimbal/Camera"


const SPEED = 5
const ROTATION_SPEED = 0.09

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	if navigationAgent.is_navigation_finished():
		animation_player.play("StretchIdle")
		return
	
	moveToPoint(delta, SPEED)
	#cam_gimbal.position = lerp(cam_gimbal.position, camera.position, .8)

func moveToPoint(_delta, speed):
	animation_player.play("Walking1")
	var targetPos = navigationAgent.get_next_path_position()
	var direction = global_position.direction_to(targetPos)
	faceDirection(targetPos)
	velocity = direction * speed
	move_and_slide()

func faceDirection(_direction):
	rotation.y=lerp_angle(rotation.y,atan2(-velocity.x,-velocity.z), ROTATION_SPEED)

func shoot_ray():
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_length = 1000
	var from = camera.project_ray_origin(mouse_pos)
	var to = from + camera.project_ray_normal(mouse_pos) * ray_length
	var space = get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.new()
	ray_query.from = from
	ray_query.to = to
	var raycast_results = space.intersect_ray(ray_query)
	navigationAgent.target_position = raycast_results.position

func _unhandled_input(_event):
	if Input.is_action_just_pressed("LeftMouse"):
		shoot_ray()
	

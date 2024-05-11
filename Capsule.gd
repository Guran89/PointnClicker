extends MeshInstance3D

func _ready():
	$Interactable.connect("interacted", _change_capsule_color)

func _change_capsule_color():
	var material = material_override as StandardMaterial3D
	if not material:
		material = StandardMaterial3D.new()
		material_override = material
		material.albedo_color = Color(randf(), randf(), randf())

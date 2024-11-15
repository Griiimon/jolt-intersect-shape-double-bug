extends Node3D

@onready var body: PhysicsBody3D = $Body
@onready var collision_shape: CollisionShape3D = %CollisionShape3D



func _ready() -> void:
	for x in range(-4, 5):
		for z in range(-4, 5):
			var coll_shape: CollisionShape3D= collision_shape.duplicate()
			coll_shape.position.x= x
			coll_shape.position.z= z
			body.add_child(coll_shape)
	
	await get_tree().physics_frame
	await get_tree().physics_frame

	var query:= PhysicsShapeQueryParameters3D.new()
	query.shape= SphereShape3D.new()
	query.shape.radius= 10
	
	var result= get_world_3d().direct_space_state.intersect_shape(query, 100)
	print(result.size())
	
	get_tree().quit()

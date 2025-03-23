extends Node

@onready var path_follow_2d: PathFollow2D = $"../Path2D/PathFollow2D"
@onready var building_boom: AudioStreamPlayer = $"../Building_boom"

@export var building: PackedScene

func create_building():
	var new_building = building.instantiate()
	
	var spawnpoint = path_follow_2d
	spawnpoint.progress_ratio = randf()
	new_building.position = spawnpoint.position
	new_building.random_building()

	add_child(new_building)


func destroy_building():
	var node_index = get_child_count() - 1
	get_child(node_index).dead()
	building_boom.play()

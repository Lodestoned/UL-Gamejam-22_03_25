extends Sprite2D

const BUILDING_1 = preload("res://assets/images/building_1.png")
const BUILDING_2 = preload("res://assets/images/building_2.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func random_building():
	
	var rng = randi_range(0,3)
	
	if(rng == 0):
		texture = BUILDING_1
		
	if(rng == 1):
		texture = BUILDING_2
		
	if(rng == 2):
		texture = BUILDING_1
		flip_h = true
		
	if(rng == 3):
		texture = BUILDING_2
		flip_h = true


func dead():
	queue_free()

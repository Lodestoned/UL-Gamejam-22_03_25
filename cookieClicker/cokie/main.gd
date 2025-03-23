extends Node2D

@onready var node: Node = $Node
@onready var boom_button: TextureButton = $BoomButton
@onready var bigger_boom_button: TextureButton = $BiggerBoomButton
@onready var building_crumble: AudioStreamPlayer = $Building_crumble

@onready var button_press: AudioStreamPlayer = $Button_press

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	button_press.play()
	node.create_building()
	
	if node.get_child_count() > 10:
		boom_button.visible = true
	
	if node.get_child_count() > 30:
		bigger_boom_button.visible = true


func _on_boom_button_pressed() -> void:
	
	# If we are blowing up the final building on screen, remove button also
	if node.get_child_count() == 1:
		boom_button.visible = false

	node.destroy_building()


func _on_bigger_boom_button_pressed() -> void:
	
	for building in node.get_children():
		building.dead()
	
	building_crumble.play()
	
	boom_button.visible = false
	bigger_boom_button.visible = false

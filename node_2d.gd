extends Node2D

@onready var car = preload("res://scenes/car.tscn")
# Called when the node enters the scene tree for the first time.
func spawn_car():
	var car_scene = car.instantiate() 
	var spawn_length = get_child_count() - 1
	print(spawn_length)
	var spawn_num = randi_range(0, spawn_length)
	print(spawn_num)
	var spawn_position = get_child(spawn_num).global_position
	car_scene.position = spawn_position   
	car_scene.rotation = randi_range(0, 190)
	car_scene.self_modulate = randi_range(1, 4)
	get_parent().add_child(car_scene)     

func _on_texture_button_pressed() -> void:
	spawn_car()

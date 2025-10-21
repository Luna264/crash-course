extends Button

@onready var node_2d: Node2D = $Node2D
var car: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_car():
	var car = car.instantiate()  # create an instance of the car
	car.position = node_2d.global_position   # set its position
	get_parent().add_child(car)     # add it to the scene tree

extends RigidBody2D

@onready var timer: Timer = $Timer
var speed = randi_range(100, 300)
var knockback_status = false
var knockback = 200
var stoplight: Node = null
var health = 250
@onready var cooldown: Timer = $cooldown

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	angular_velocity = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	speed = randi_range(100, 300)
	pass
	
func _physics_process(delta: float) -> void:
	if stoplight == null:
		return
	match stoplight.color:
		"red":
			speed = 0
		"yellow":
			speed = randi_range(20, 30)
		"green":
			speed = randi_range(100, 500)
	var direction = Vector2.UP.rotated(rotation)
	if knockback_status == false:
		linear_velocity = speed * direction
		rotation += randf_range(-0.01, 0.01)

func _on_timer_timeout() -> void:
	knockback_status = false
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	knockback_status = true
	var knockback_dir = (area.global_position - global_position).normalized()
	if knockback_status == true:
		apply_central_force(speed * knockback_dir)
	timer.start()
	
	var car = area.get_parent()
	if car.is_in_group("cars"):
		car.health -= randi_range(6, 7)
	if car.is_in_group("cars") and car.health <= 0:
		await get_tree().create_timer(0.7).timeout
		if car:
			car.queue_free()
	

extends RigidBody2D

@onready var timer: Timer = $Timer
var speed = randi_range(100, 155)
var knockback_status = false
var knockback = 200
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	angular_velocity = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	var direction = Vector2.UP.rotated(rotation)
	if knockback_status == false:
		linear_velocity = speed * direction


func _on_timer_timeout() -> void:
	knockback_status = false
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	knockback_status = true
	var knockback_dir = (area.global_position - global_position).normalized()
	if knockback_status == true:
		linear_velocity = knockback * knockback_dir
	timer.start()

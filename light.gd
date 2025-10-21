extends Node2D

@onready var green: Sprite2D = $CharacterBody2D/green
@onready var yellow: Sprite2D = $CharacterBody2D/yellow
@onready var red: Sprite2D = $CharacterBody2D/red
var cars_in_area: Array = []
var color = "red" 

func _ready() -> void:
	red.visible = true
	update_light()

func _on_button_pressed() -> void:
	match color:
		"red":
			color = "green"
		"yellow":
			color = "red"
		"green":
			color = "yellow"
	update_light()
	
func update_light() -> void:
	if color == "red":
		red.visible = true
		yellow.visible = false
		green.visible = false
	if color == "yellow":
		yellow.visible = true
		red.visible = false
		green.visible = false
	if color == "green":
		green.visible = true
		red.visible = false
		yellow.visible = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("cars"):
		area.get_parent().stoplight = self
		
func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("cars"):
		area.get_parent().stoplight = null

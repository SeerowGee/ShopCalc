extends Node2D
const MODULE = preload("res://Module/module.tscn")
@onready var num_label: Label = $NumLabel
@onready var module_spawn: Marker2D = $ModuleSpawn
@onready var module_spawn_2: Marker2D = $ModuleSpawn2
@onready var module_spawn_3: Marker2D = $ModuleSpawn3
var total: int = 0
var modules_spawned: int = 0
@onready var spawn_point = module_spawn.global_position

func _ready() -> void:
	SignalBus.cost_signal.connect(display_cost)

func display_cost(cost):
	total += cost
	num_label.text = str(total)


func _on_button_pressed() -> void:
	if modules_spawned == 1:
		spawn_point = module_spawn_3.global_position
	if modules_spawned == 2:
		spawn_point = module_spawn_2.global_position
	var new_module = MODULE.instantiate()
	add_child(new_module)
	new_module.global_position = spawn_point
	
	modules_spawned += 1
	

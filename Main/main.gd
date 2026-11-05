extends Node2D
const MODULE = preload("res://Module/module.tscn")
@onready var num_label: Label = $NumLabel
@onready var module_spawn: Marker2D = $ModuleSpawn
@onready var module_spawn_2: Marker2D = $ModuleSpawn2
@onready var module_spawn_3: Marker2D = $ModuleSpawn3
@onready var spawn_point = module_spawn.global_position
var modules: Array = []

func _ready() -> void:
	SignalBus.cost_signal.connect(calculate_total)
	SignalBus.erase.connect(remove_module)

func calculate_total():
	var num: float = 0
	
	for i in modules:
		num += i.cost
	
	display_cost(num)
	
	num = 0

func display_cost(total):
	num_label.text = str(total)

func remove_module(module):
	modules.erase(module)

func _on_button_pressed() -> void:
	var new_module = MODULE.instantiate()
	add_child(new_module)
	new_module.global_position = spawn_point
	
	modules.append(new_module)

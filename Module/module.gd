extends Node2D

@export var cost: float
var mouse_entered: bool = false

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	
	if mouse_entered and Input.is_action_pressed("left_click"):
		global_position = mouse_pos

func _on_cost_text_submitted(new_text: String) -> void:
	cost = float(new_text)
	SignalBus.cost_signal.emit()

func _on_color_rect_mouse_entered() -> void:
	mouse_entered = true

func _on_color_rect_mouse_exited() -> void:
	mouse_entered = false


func _on_button_pressed() -> void:
	SignalBus.erase.emit(self)
	queue_free()

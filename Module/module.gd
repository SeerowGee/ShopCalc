extends Node2D

var cost: float

func _on_cost_text_submitted(new_text: String) -> void:
	cost = float(new_text)
	SignalBus.cost_signal.emit(cost)
	#print(cost)

class_name GoalContainer
extends Node



var goals: Array[Goal] = []


func _ready() -> void:
	for child: Node in get_children():
		if child is Goal:
			goals.append(child)

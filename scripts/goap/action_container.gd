class_name ActionContainer
extends Node


var actions: Array[Action] = []


func _ready() -> void:
	for child: Node in get_children():
		if child is Action:
			actions.append(child)

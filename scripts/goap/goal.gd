@abstract
class_name Goal
extends Node


@export var goal_name: String


@abstract
func is_available(state: State) -> bool


@abstract
func is_fulfilled(state: State) -> bool


@abstract
func projected_cost(state: State) -> float


func _to_string() -> String:
	return goal_name

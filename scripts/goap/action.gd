@abstract
class_name Action
extends Node


@export var action_name: String


@abstract
func run(agent)


@abstract
func cost(state: State) -> float


@abstract
func is_available(state: State) -> bool


@abstract
func resultant(state: State) -> State


func _to_string() -> String:
	return action_name

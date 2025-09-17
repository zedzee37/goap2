class_name PlannerTreeState
extends State


# int
@export var trees: int = 1
@export var durability: float = 2.0


func _init(_trees: int, _durability: float) -> void:
	trees = _trees
	durability = _durability

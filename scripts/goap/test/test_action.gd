class_name TestAction
extends Action


func run(_agent):
	pass


func cost(_state: State) -> int:
	return 1


func is_available(_state: State) -> bool:
	if _state is not PlannerTreeState:
		return false

	return _state.trees > 0


func resultant(state: State) -> State:
	if state is not PlannerTreeState:
		return null

	return PlannerTreeState.new(state.trees - 1, state.durability + 1.0)


class_name BetterTestAction
extends Action


func run(_agent):
	pass


func is_available(state: State) -> bool:
	return state is PlannerTreeState and state.trees > 1 and state.durability > 0


func cost(_state: State) -> float:
	return 1.0


func resultant(state: State) -> State:
	if state is not PlannerTreeState:
		return null

	return PlannerTreeState.new(state.trees - 2, state.durability - 1)

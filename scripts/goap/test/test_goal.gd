class_name TestGoal
extends Goal


func is_available(state: State) -> bool:
	if state is not PlannerTreeState:
		return false

	return state.trees > 0


func is_fulfilled(state: State) -> bool:
	return state is PlannerTreeState and state.trees == 0


class_name Planner
extends Node


@onready var goal_container: GoalContainer = $GoalContainer
@onready var action_container: ActionContainer = $ActionContainer


# TODO: replace this with an A* search
func find_lowest_cost_path(goal: Goal, current_state: State) -> Array[Action]:
	var actions: Array[Action] = []

	if goal.is_fulfilled(current_state):
		return actions

	var head_action := ActionNode.new(0.0, null, null)
	var ending_nodes: Array[ActionNode] = []
	_continue_path(goal, current_state, head_action, ending_nodes)

	if ending_nodes.is_empty():
		return actions

	var best_path: ActionNode = ending_nodes[0]
	for node: ActionNode in ending_nodes:
		if node.total_cost < best_path.total_cost:
			best_path = node

	var current := best_path
	while current.parent != null:
		actions.append(current.action)
		current = current.parent
	
	return actions


func _continue_path(
	goal: Goal, 
	state: State, 
	parent: ActionNode, 
	ending_nodes: Array[ActionNode]
):
	if goal.is_fulfilled(state):
		ending_nodes.append(parent)
		return

	for action: Action in action_container.actions:
		if not action.is_available(state):
			continue

		var new_node := ActionNode.new(parent.total_cost, action, state, parent)
		_continue_path(goal, new_node.action.resultant(state), new_node, ending_nodes)

		if new_node.action.resultant(state).durability < 0:
			print_debug("gug")


class ActionNode:
	var total_cost: float
	var children: Array[ActionNode]
	var parent: ActionNode
	var action: Action

	func _init(_total_cost: float, _action: Action, state: State, _parent: ActionNode = null) -> void:
		var action_cost = 0

		if _action != null:
			action_cost = _action.cost(state)

		self.total_cost = _total_cost + action_cost
		self.children = []
		self.parent = _parent
		self.action = _action
	
	func add_child(child: ActionNode) -> void:
		self.children.append(child)	

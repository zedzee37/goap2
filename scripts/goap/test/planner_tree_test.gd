extends Test


@onready var planner: Planner = $Planner


func test(builder: TestBuilder) -> void:
	builder.expect(planner != null and planner.action_container != null and planner.goal_container != null)
	builder.expect(not planner.goal_container.goals.is_empty() and not planner.action_container.actions.is_empty())

	var state := PlannerTreeState.new(5)
	var path := planner.find_lowest_cost_path(planner.goal_container.goals[0], state)

	print_debug(path)

	# var expected := true
	# for i in range(5):
	# 	if path[i] != planner.action_container.actions[0]:
	# 		expected = false
	# 		break

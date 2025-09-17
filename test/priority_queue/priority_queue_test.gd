extends Test


func test(builder: TestBuilder) -> void:
	var queue := PriorityQueue.new(func(a, b): return a < b)

	queue.insert(10)

	builder.expect_equal(queue.pop(), 10)
	builder.expect_equal(queue.size(), 0)

	var list := [4324, 61, 4, 6374, 400, 23, 41, 2, 3, 1, 6545, 2]
	for n in list:
		queue.insert(n)

	var constructed_list := []
	while queue.size() > 0:
		constructed_list.append(queue.pop())
	

	list.sort()

	builder.expect_equal(constructed_list.size(), list.size())

	var broken := false
	for i in range(len(constructed_list)):
		if constructed_list[i] != list[i]:
			broken = true
	builder.expect_equal(broken, false)

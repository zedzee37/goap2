class_name PriorityQueue
extends RefCounted


var comparison_predicate: Callable
var _heap: Array


func _init(_comparison_predicate: Callable) -> void:
	self.comparison_predicate = _comparison_predicate
	self._heap = []


func insert(value) -> void:
	_heap.append(value)
	_cascade_up(len(_heap) - 1)


func pop():
	if len(_heap) == 0:
		return null

	var value = _heap[0]

	if len(_heap) == 1:
		_heap = []
		return value	

	_swap(0, len(_heap) - 1)
	_heap.pop_back()
	_cascade_down(0)

	return value


func size() -> int:
	return _heap.size()


func _left(i: int) -> int:
	return (2 * i) + 1


func _right(i: int) -> int:
	return (2 * i) + 2


func _parent(i: int) -> int:
	return floor((i - 1.0) / 2.0)


func _cascade_down(i: int) -> void:
	var length := _heap.size()

	var left_idx := _left(i)
	var right_idx := _right(i)

	var best_idx := i
	var current_best = _heap[i]

	if left_idx < length and comparison_predicate.call(_heap[left_idx], current_best):
		current_best = _heap[left_idx]
		best_idx = left_idx
	if right_idx < length and comparison_predicate.call(_heap[right_idx], current_best):
		current_best = _heap[right_idx]
		best_idx = right_idx

	if best_idx != i:
		_swap(best_idx, i)
		_cascade_down(best_idx)


func _cascade_up(i: int) -> void:
	if i == 0:
		return

	var value = _heap[i]
	var parent_idx := _parent(i)
	var parent_value = _heap[parent_idx]

	if comparison_predicate.call(value, parent_value):
		_swap(i, parent_idx)
		_cascade_up(parent_idx)


func _swap(i: int, j: int) -> void:
	var tmp = _heap[j]
	_heap[j] = _heap[i]
	_heap[i] = tmp

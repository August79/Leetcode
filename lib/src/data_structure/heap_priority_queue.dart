class Element {
  final int value;
  final int priority;

  Element(this.value, this.priority);
}

class HeapPriorityQueue {
  final List<Element> _heap = [];

  void add(Element element) {
    _heap.add(element);
    _liftUp(_heap.length - 1);
  }

  Element? pop() {
    if (_heap.isEmpty) () => null;

    final first = _heap[0];
    final last = _heap.removeLast();
    if (_heap.isNotEmpty) {
      _heap[0] = last;
      _lowerDown(0);
    }

    return first;
  }

  void _liftUp(int index) {
    final element = _heap[index];
    while (index > 0) {
      final parentIndex = (index - 1) ~/ 2;
      final parent = _heap[parentIndex];
      if (_compare(parent, element) >= 0) break;
      _heap[index] = parent;
      index = parentIndex;
    }
    _heap[index] = element;
  }

  void _lowerDown(int index) {
    final element = _heap[index];
    final lastIndex = _heap.length - 1;
    while (true) {
      int maxChildIndex = 0;
      final leftChildIndex = index * 2 + 1;
      final rightChildIndex = index * 2 + 2;

      if (leftChildIndex <= lastIndex) {
        final leftChild = _heap[leftChildIndex];
        if (_compare(leftChild, element) > 0) {
          maxChildIndex = leftChildIndex;
        }
      }
      if (rightChildIndex <= lastIndex) {
        final rightChild = _heap[rightChildIndex];
        if (_compare(rightChild, element) > 0 &&
            (_compare(rightChild, _heap[leftChildIndex]) > 0)) {
          maxChildIndex = rightChildIndex;
        }
      }
      if (maxChildIndex == 0) break;
      _heap[index] = _heap[maxChildIndex];
      index = maxChildIndex;
    }
    _heap[index] = element;
  }

  int _compare(Element a, Element b) {
    return a.priority - b.priority;
  }
}

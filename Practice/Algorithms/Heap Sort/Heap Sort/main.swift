// Heap sort
struct Heap<Element> {
    var elements: [Element]
    let priorityFunction: (Element, Element) -> Bool
    var isEmpty: Bool { return elements.isEmpty }
    var count: Int { return elements.count }
    
    init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    mutating func buildHeap() {
        for index in (0..<count / 2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }
    
    func peek() -> Element? { return elements.first }
    func isRoot(_ index: Int) -> Bool { return (index == 0) }
    func leftChildrenIndex(of index: Int) -> Int { return (2 * index) + 1 }
    func rightChildrenIndex(of index: Int) -> Int { return (2 * index) + 2 }
    func parentIndex(of index: Int) -> Int { return (index - 1) / 2 }
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex) else { return parentIndex }
        return childIndex
    }
    func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildrenIndex(of: parent)), and: rightChildrenIndex(of: parent))
    }
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex else { return }
        elements.swapAt(firstIndex, secondIndex)
    }
    mutating func enqueue(_ element: Element) {
        elements.append(element)
        siftUp(elementAtIndex: count - 1)
    }
    // Swap
    mutating func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index), isHigherPriority(at: index, than: parent) else { return }
        swapElement(at: index, with: parent)
        siftUp(elementAtIndex: parent)
    }
    mutating func dequeue() -> Element? {
        guard !isEmpty else { return nil }
        
        swapElement(at: 0, with: count - 1)
        
        let element = elements.removeLast()
        if !isEmpty { siftDown(elementAtIndex: 0) }
        return element
    }
    mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        if index == childIndex { return }
        swapElement(at: index, with: childIndex)
        siftDown(elementAtIndex: childIndex)
    }
    
    mutating func siftDown(elementAtIndex index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildrenIndex(of: index)
        let rightChildIndex = leftChildIndex + 1
        
        var first = index
        if leftChildIndex < endIndex && priorityFunction(elements[leftChildIndex], elements[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && priorityFunction(elements[rightChildIndex], elements[first]) {
            first = rightChildIndex
        }
        if first == index { return }
        
        elements.swapAt(index, first)
        siftDown(elementAtIndex: first, until: endIndex)
    }
}

extension Heap {
    mutating func sort() -> [Element] {
        for i in stride(from: (elements.count - 1), through: 1, by: -1) {
            elements.swapAt(0, i)
            siftDown(elementAtIndex: 0, until: i)
        }
        return elements
    }
}

var h1 = Heap(elements: [5, 13, 2, 25, 7, 17, 20, 8, 4], priorityFunction: < )
print(h1.sort())

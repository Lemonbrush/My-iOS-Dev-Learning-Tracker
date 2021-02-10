// Heap data structure

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
}

/*
 The tree:
 
            8               1 level
            |
      -------------
      |            |
     7             5        2 level
     |             |
  ------       ---------
 |      |      |       |
 6      3      2       1    3 level
 |
 4                          4 level
 
 The heap:
 
             levels
       1    2       3      4
     [ 8,  7,5   6,3,2,1,  4 ]
 i -   0   1 2   3 4 5 6   7
 
 left = 2i + 1
 right = 2i + 2
 
 
 */

var hp = Heap(elements: [4, 1, 2, 3, 6, 5, 7, 8], priorityFunction: >)
print(hp.elements)

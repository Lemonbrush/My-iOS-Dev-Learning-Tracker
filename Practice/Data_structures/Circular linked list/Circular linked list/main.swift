// Circular linked list

// Core node
class Node<T: Equatable> {
    var next: Node<T>?
    var prev: Node<T>?
    var value: T?
    
    init(value: T?) {
        self.value = value
        self.next = nil
        self.prev = nil
    }
}

// Make nodes able to be comparable
extension Node: Equatable {
    static func == (left: Node, right: Node) -> Bool {
        return left.value == right.value
    }
}

class cLList<T: Equatable> {
    var head: Node<T>?
    var current: Node<T>?
    
    func insert(value: T) -> Node<T> {
        let newNode = Node(value: value)
        
        if self.head == nil {
            newNode.next = newNode
            newNode.prev = newNode
            self.head = newNode
            current = self.head
        } else {
            // If list is not empty
            // Find last node
            let last = self.head?.prev
            newNode.next = self.head
            self.head?.prev = newNode
            newNode.prev = last
            last?.next = newNode
            current = last
        }
        
        return current!
    }
    
    func isEqual(left: Node<T>?, right: Node<T>?) -> Bool {
        if left == right { return true }
        return false
    }
    
    func display() {
        var nextNode = self.head
        repeat {
            print(nextNode!.value!)
            nextNode = nextNode?.next
        } while !(nextNode == self.head)
    }
}

var circularList = cLList<Int>()

for i in 1...20 {
    circularList.insert(value: i)
}

circularList.display()

/*
var nextNode = circularList.head
while !(nextNode == nil) {
    print(nextNode!.value!)
    nextNode = nextNode?.next
}
*/

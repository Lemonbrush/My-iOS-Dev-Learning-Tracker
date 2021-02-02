// Linked List

class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    typealias Node = LinkedListNode<T>
    
    private var head: Node?
    
    var isEmpty: Bool { return head == nil }
    
    var first: Node? { return head }
    
    var last: Node? {
        guard var node = head else { return nil }
        
        while let next = node.next { node = next }
        
        return node
    }
    
    //It could be better
    var count: Int {
        guard var node = head else { return 0 }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    func append(_ value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    func insert(_ node: Node, atIndex index: Int) {
        let newNode = node
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let prev = self.node(atIndex: index - 1)
            let next = prev.next
            
            newNode.previous = prev
            newNode.next = prev.next
            prev.next = newNode
            next?.previous = newNode
        }
    }
    
    func node(atIndex index: Int) -> Node {
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil { break }
            }
            return node!
        }
    }
    
    func removeAll() { head = nil }
    
    func remove(node: Node) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        node.previous = nil
        node.next = nil
        return node.value
    }
    
    func removeLast() -> T {
        assert(!isEmpty)
        return remove(node: last!)
    }
    
    func removeAt(_ index: Int) -> T {
        let nodeToRemove = node(atIndex: index)
        //assert(nodeToRemove != nil)
        return remove(node: nodeToRemove)
    }
    
    subscript(index: Int) -> T {
        let nodeToValue = node(atIndex: index)
        return nodeToValue.value
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        var s = "["
        var node = head
        while node != nil {
            s += "\(node!.value)"
            node = node!.next
            if node != nil { s += ", " }
        }
        return s + "]"
    }
}

let list = LinkedList<String>()
list.append("Hello")
list.append("World")

list.insert(LinkedListNode<String>(value: "Swift"), atIndex: 1)

print(list[0])
print(list[1])
print(list.last!.value)

print(list.description)


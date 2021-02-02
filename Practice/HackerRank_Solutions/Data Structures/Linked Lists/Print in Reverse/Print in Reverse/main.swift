import Foundation

final class SinglyLinkedListNode {
    var data: Int
    var next: SinglyLinkedListNode?

    public init(nodeData: Int) {
        self.data = nodeData
    }
}

final class SinglyLinkedList {
    var head: SinglyLinkedListNode?
    var tail: SinglyLinkedListNode?

    public init() {}

    public func insertNode(nodeData: Int) {
        self.insertNode(node: SinglyLinkedListNode(nodeData: nodeData))
    }

    private func insertNode(node: SinglyLinkedListNode) {
        if let tail = tail {
            tail.next = node
        } else {
            head = node
        }

        tail = node
    }
}

func printSinglyLinkedList(head: SinglyLinkedListNode?, sep: String) {
    var node = head

    while node != nil {
        print(node!.data, terminator: "")

        node = node!.next

        if node != nil {
            print(sep, terminator: "")
        }
    }
}

var testList = SinglyLinkedList()
for i in 1...5 { testList.insertNode(nodeData: i) }

// Complete the reversePrint function below.

/*
 * For your reference:
 *
 * SinglyLinkedListNode {
 *     data: Int
 *     next: SinglyLinkedListNode?
 * }
 *
 */

/*
func reversePrint(head: SinglyLinkedListNode?) -> Void {
    var iterNode = head
    var arr = [Int]()
    
    while iterNode != nil {
        arr.append(iterNode!.data)
        iterNode = iterNode!.next
    }
    
    for i in stride(from: arr.count, through: 1, by: -1) {
        print(i)
    }
}
 */

func reversePrint(head: SinglyLinkedListNode?) -> Void {
    if head != nil {
        reversePrint(head: head!.next)
        print(head!.data)
    }
}

reversePrint(head: testList.head)

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

func printSinglyLinkedList(head: SinglyLinkedListNode?, sep: String, fileHandle: FileHandle) {
    var node = head

    while node != nil {
        fileHandle.write(String(node!.data).data(using: .utf8)!)

        node = node!.next

        if node != nil {
            fileHandle.write(sep.data(using: .utf8)!)
        }
    }
}

var testList = SinglyLinkedList()
testList.insertNode(nodeData: 0)
testList.insertNode(nodeData: 1)
testList.insertNode(nodeData: 2)
testList.insertNode(nodeData: 3)

// Complete the getNode function below.

/*
 * For your reference:
 *
 * SinglyLinkedListNode {
 *     data: Int
 *     next: SinglyLinkedListNode?
 * }
 *
 */
func getNode(head: SinglyLinkedListNode?, positionFromTail: Int) -> Int {
    var iterNode = head
    var result: Int = 0
    var listCount: Int = 0
    
    var countNode = head
    while countNode != nil {
        listCount += 1
        countNode = countNode?.next
    }
    
    let iterator = listCount - positionFromTail
    for _ in 0...iterator {
        result = iterNode!.data
        iterNode = iterNode!.next!
    }
    
    return result
}

print(getNode(head: testList.head, positionFromTail: 2))

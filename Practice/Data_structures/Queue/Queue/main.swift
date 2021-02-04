// Queue implementation
public struct Queue<T> {
    var array = [T?]()
    var head = 0
    var isEmpty: Bool { return count == 0 }
    var count: Int { return array.count - head }
    var front: T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
    
    mutating func enqueue(_ element: T) { array.append(element) }
    
    mutating func dequeue() -> T? {
        // If it is not empty
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        let percentage = Double(head)/Double(array.count)
        if array.count > 50 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
}

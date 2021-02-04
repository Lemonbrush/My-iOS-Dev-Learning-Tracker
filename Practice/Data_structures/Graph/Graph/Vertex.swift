public struct Vertex<T: Hashable> {
    var data: T
}

extension Vertex: Hashable {
    public var hashValue: Int { return "\(data)".hashValue }
    
    static public func == (left: Vertex, right: Vertex) -> Bool { return left.data == right.data }
}

extension Vertex: CustomStringConvertible {
    public var description: String { return "\(data)" }
}

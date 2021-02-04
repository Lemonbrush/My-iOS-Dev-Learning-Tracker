public enum EdgeType {
    case directed, undirected
}

public struct Edge<T: Hashable> {
    public var source: Vertex<T>
    public var destination: Vertex<T>
    public let weight: Double?
}

extension Edge: Hashable {
    public var hashValue: Int { return "\(source)\(destination)\(weight)".hashValue }
    
    static public func == (left: Edge<T>, right: Edge<T>) -> Bool {
        return left.source == right.source &&
            left.destination == right.destination &&
            left.weight == right.weight
    }
}

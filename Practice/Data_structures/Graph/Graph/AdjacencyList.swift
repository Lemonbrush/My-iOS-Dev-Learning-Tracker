open class AdjacencyList<T: Hashable> {
    public var adjacencyDict: [Vertex<T>: [Edge<T>]] = [:]
    fileprivate func addDirectEdge(from source: Vertex<Element>,
                                   to destination: Vertex<Element>,
                                   weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencyDict[source]?.append(edge)
    }
    fileprivate func addUndirectedEdge(vertices: (Vertex<Element>, Vertex<Element>), weight: Double?) {
        let (source, destination) = vertices
        addDirectEdge(from: source, to: destination, weight: weight)
        addDirectEdge(from: destination, to: source, weight: weight)
    }
    public init() {}
}

extension AdjacencyList: Graphable {
    public typealias Element = T
    
    var description: CustomStringConvertible {
        var result = ""
        
        for (vertex, edges) in adjacencyDict {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ] \n")
        }
        
        return result
    }
    
    func createVertex(data: Element) -> Vertex<Element> {
        let vertex = Vertex(data: data)
        /*
         Based on the data passed in you create a Vertex
         You check to see if the vertex already exists
         If it doesn’t you initialize an array of edges and return the vertex
         */
        if adjacencyDict[vertex] == nil { adjacencyDict[vertex] = [] }
        
        return vertex
    }
    
    func add(_ type: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        switch type {
        case .directed: addDirectEdge(from: source, to: destination, weight: weight)
        case .undirected: addUndirectedEdge(vertices: (source, destination), weight: weight)
        }
    }
    
    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        guard let edges = adjacencyDict[source] else { return nil }
        
        for edge in edges {
            if edge.destination == destination { return edge.weight }
        }
        
        return nil
    }
    
    func edges(from source: Vertex<T>) -> [Edge<T>]? {
        return adjacencyDict[source]
    }
    
}

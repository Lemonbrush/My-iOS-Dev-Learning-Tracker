/*
 Going over the protocol:
 The protocol requires an associatedType called Element. This allows the protocol to be generic, to hold any type.
 The description property lets you define custom behavior to print out the contents of a graph. This can help with debugging!
 createVertex(data:) provides a utility method to create a vertex.
 add(_:from:to:weight:) provides a utility to add an edge between two vertices. You can specify the weight as well as whether an edge is directed or undirected.
 weight(from:to:) provides a utility to get the weight of an edge between two vertices.
 edges(from:) provides a utility to retrieve all the edges that source vertex connects to.
*/

protocol Graphable {
    associatedtype Element: Hashable
    var description: CustomStringConvertible { get }
    
    func createVertex(data: Element) -> Vertex<Element>
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
    func edges(from source: Vertex<Element>) -> [Edge<Element>]?
}

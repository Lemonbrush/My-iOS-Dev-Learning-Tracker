// Hash Set implementation
struct HashSet<T: Hashable> {
    fileprivate var dictionary = Dictionary<T, Bool>()
    var count: Int { return dictionary.count }
    var isEmpty: Bool { return dictionary.isEmpty }
    
    init() {}
    
    mutating func insert(_ value: T) { dictionary[value] = true }
    
    mutating func remove(_ value: T) { dictionary[value] = nil }
    
    func contains(_ value: T) -> Bool { return dictionary[value] != nil }
    
    func allElements() -> [T] { return Array(dictionary.keys) }
}

extension HashSet {
    func union(_ otherSet: HashSet<T>) -> HashSet<T> {
        var combined = HashSet<T>()
        for obj in self.dictionary.keys { combined.insert(obj) }
        for obj in otherSet.dictionary.keys { combined.insert(obj) }
        return combined
    }
}

extension HashSet {
    func intersect(_ otherSet: HashSet<T>) -> HashSet<T> {
        var common = HashSet<T>()
        for obj in dictionary.keys {
            if otherSet.contains(obj) { common.insert(obj) }
        }
        return common
    }
}

extension HashSet {
    func difference(_ otherSet: HashSet<T>) -> HashSet<T> {
        var diff = HashSet<T>()
        
        for obj in dictionary.keys {
            if !(otherSet.contains(obj)) { diff.insert(obj) }
        }
        return diff
    }
}

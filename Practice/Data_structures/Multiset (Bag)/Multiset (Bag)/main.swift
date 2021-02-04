// Multiset or Bag

struct Multiset<Element: Hashable> {
    var storage: [Element: UInt] = [:]
    
    mutating func add(_ value: Element) {
        storage[value, default: 0] += 1
    }
    mutating func remove(_ elem: Element) {
        if let currentCount = storage[elem] {
            if currentCount > 1 {
                storage[elem] = currentCount - 1
            } else {
                storage.removeValue(forKey: elem)
            }
        }
    }
    func count(for key: Element) -> UInt {
        return storage[key] ?? 0
    }
    var count: Int {
        return storage.count
    }
    func isSubSet(of value: Multiset) -> Bool {
        
        for i in storage.keys {
            if value.storage[i] == nil { return false }
        }
        
        return true
    }
    init(with value: Element) {
        self.add(value)
    }
    init() {}
}

var mults1 = Multiset<Character>()

for i in "cacti" {
    mults1.add(i)
}

var mults2 = Multiset<Character>()

for i in "tactical" {
    mults2.add(i)
}

print(mults1.isSubSet(of: mults2))

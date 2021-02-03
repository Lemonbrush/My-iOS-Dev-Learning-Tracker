// Implementing multidictionary

class Multimap<K: Hashable, V> {
    var dictionary = Dictionary<K, [V]>()
    
    
    func add(to key: K, value: V) {
        if self.dictionary[key] != nil {
            self.dictionary[key]!.append(value)
        } else {
            let newDict = [value]
            dictionary[key] = newDict
        }
    }
    func printDict() {
        print(dictionary)
    }
}

var multiMap = Multimap<String, String>()
multiMap.add(to: "Alex", value: "code")
multiMap.add(to: "Alex", value: "toys")
multiMap.add(to: "Alex", value: "fun")
multiMap.add(to: "Sofia", value: "toys")

multiMap.printDict()

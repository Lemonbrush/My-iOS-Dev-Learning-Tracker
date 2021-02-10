// Tree data structure
class Node {
    var value: String
    var children: [Node] = []
    weak var parent: Node?
    
    init(value: String) {
        self.value = value
    }
    
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
    
    func add(children: [Node]) {
        for ch in children {
            self.children.append(ch)
            ch.parent = self
        }
    }
    
    func search(value: String) -> Node? {
        if value == self.value { return self }
        
        for child in children {
            if let found = child.search(value: value) { return found }
        }
        
        return nil
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        var text = "\(value)"
        if !children.isEmpty {
            text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
        }
        return text
    }
}

let beverages = Node(value: "beverages")

let hotBeverages = Node(value: "hot")
let tea = Node(value: "tea")
let black = Node(value: "black")
let green = Node(value: "green")
let chai = Node(value: "chai")
tea.add(children: [black, green, chai])

let coffee = Node(value: "coffee")
let cocoa = Node(value: "cocoa")
hotBeverages.add(children: [tea, coffee, cocoa])

let coldBeverages = Node(value: "cold")
let soda = Node(value: "soda")
let gingerAle = Node(value: "ginger ale")
let bitterLemon = Node(value: "bitter lemon")
soda.add(children: [gingerAle, bitterLemon])

let milk = Node(value: "milk")
coldBeverages.add(children: [soda, milk])

beverages.add(children: [hotBeverages, coldBeverages])

print(beverages)
print(beverages.search(value: "green")!)

/*
 beverages {hot {tea {black, green, chai} , coffee, cocoa} , cold {soda {ginger ale, bitter lemon} , milk} }
 green
 */

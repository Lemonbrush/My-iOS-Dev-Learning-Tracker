/*
 You have an empty sequence, and you will be given N queries. Each query is one of these three types:
 
 1 x  -Push the element x into the stack.
 2    -Delete the element present at the top of the stack.
 3    -Print the maximum element in the stack.
 
 Input Format
 The first line of input contains an integer, N. The next N lines each contain an above mentioned query. (It is guaranteed that each query is valid.)
 
 Output Format
 For each type 3 query, print the maximum element in the stack on a new line.
 */

import Foundation

struct Stack {
    var elements = [Int]()
    
    mutating func push(_ value: Int) {
        elements.append(value)
    }
    mutating func delete() {
        elements.removeLast()
    }
    func getMax() -> Int {
        var maxElem = elements[0]
        for i in elements {
            if i > maxElem { maxElem = i }
        }
        return maxElem
    }
}

var stack = Stack()
var result = [Int]()

let n = Int(readLine()!)

for _ in 1...n! {
    let x = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
    switch x[0] {
        case 1:
            let newValue = x[1]
            stack.push(newValue)
    case 2: if !stack.elements.isEmpty { stack.delete() }
    case 3: result.append(stack.getMax())
    default:
        break
    }
}

for i in result { print(i) }






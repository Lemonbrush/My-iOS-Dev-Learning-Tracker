// Print reversed string
func printReverse(str: [Character]) {
    
    func reverseString(count: Int) {
        guard count < str.count else { return }
        
       reverseString(count: count + 1)
        print(str[count])
    }
    
    reverseString(count: 0)
}

//printReverse(str: Array("Hello"))

// Reverse string
func reverseString(_ s: inout [Character]) {
    
    var count = s.count
    
    func reverse(string: inout [Character], count: inout Int) {
        guard count > 0 else { return }
            
            if let toAppend = s.popLast()
            {
                count -= 1
                s.insert(toAppend, at: s.count - count)
                reverse(string: &string, count: &count)
            }
    }
    
    var f = s
    reverse(string: &f, count: &count)
}

var arry = Array("Hello")
print("Before - ",arry)
reverseString(&arry)
print("After - ",arry)

// Boyer Moore String Search Algorithm

extension String {
    // This will enumerate over a string and return a dictionary with it’s characters as keys and an integer representing the amount it should skip by
    fileprivate var skipTable: [Character: Int] {
        var skipTable: [Character: Int] = [:]
        for (i, c) in enumerated() {
            skipTable[c] = count - i - 1
        }
        return skipTable
    }
    
    fileprivate func match(from currentIndex: Index, with pattern: String) -> Index? {
        
        /*
         More concise way for the expressions
         
        guard currentIndex < startIndex &&
                currentIndex >= endIndex &&
                self[currentIndex] != pattern.last else {
            return nil
        }
         */
 
        // Bounds checking
        if currentIndex < startIndex { return nil }
        if currentIndex >= endIndex { return nil }
        
        // If the characters don't match
        if self[currentIndex] != pattern.last { return nil }
        
        // If the final character in pattern matches, then you’ll return the current index, indicating a match was made at starting at this location.
        if pattern.count == 1 && self[currentIndex] == pattern.last { return currentIndex }
        
        return match(from: index(before: currentIndex), with: "\(pattern.dropLast())")
    }
    
    func index(of pattern: String) -> Index? {
        let patternLength = pattern.count
        // Check if the length of the pattern string is within the bounds of source string
        guard patternLength > 0, patternLength <= count else { return nil }
        
        // Keep track of the skip table for the pattern string, and it's last character.
        let skipTable = pattern.skipTable
        let lastChar = pattern.last!
        
        var i = index(startIndex, offsetBy: patternLength - 1)
        
        // Traverse source string until the end
        while i < endIndex {
            let c = self[i]
            
            // In case of letters match
            if c == lastChar {
                // Search and return if success
                if let k = match(from: i, with: pattern) { return k }
                // Continue to iterate
                i = index(after: i)
            } else {
                // Skip some amount of letters of whole pattern length
                i = index(i, offsetBy: skipTable[c] ?? patternLength, limitedBy: endIndex) ?? endIndex
            }
        }
        
        return nil
    }
}

let hello = "Hello world"
let pattern = "world"
let indexToShow = hello.index(of: pattern)
print(hello[indexToShow!])

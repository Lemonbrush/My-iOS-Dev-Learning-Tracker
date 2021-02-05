/*
 Brute-force string search
 
 This looks at each character in the source string in turn. If the character equals the first character of the search pattern, then the inner loop checks whether the rest of the pattern matches. If no match is found, the outer loop continues where it left off. This repeats until a complete match is found or the end of the source string is reached.
 */

extension String {
    func indexOf(_ pattern: String) -> String.Index? {
        for i in self.indices {
            var currentCharacter = i
            var found = true
            
            for p in pattern.indices {
                if currentCharacter == self.endIndex || self[currentCharacter] != pattern[p]
                {
                    found = false
                    break
                } else {
                    currentCharacter = self.index(after: currentCharacter)
                }
            }
            
            if found { return i }
        }
        return nil
    }
}

var str = "Hello"
var ind = str.indexOf("eb")

if let resultInd = ind {
    print(str[resultInd])
} else {
    print("Match not found")
}

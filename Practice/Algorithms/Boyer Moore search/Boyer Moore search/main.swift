/*
 THIS IS A TEST
 TEST
 
 skipList:
 T E S
 1 2 1 4
 
 */

extension String {
    var skipList: [Character: Int] {
        var skipList = [Character: Int]()
        
        for (i, c) in enumerated() {
            skipList[c] = self.count - i - 1
        }
        return skipList
    }
    
    //Find match
    func look(from ind: Index, for sample: String) -> Index? {
        // Check for bounds and matching
        guard ind <= self.endIndex && sample.count > 0 && self[ind] == sample.last else { return nil }
        
        print("Comparing \(self[ind]) and \(sample) <-")
        
        // If it is the end of the sample and it is matches to the last char of the text
        if sample.count == 1 && self[ind] == sample.last { return ind }
        
        // Continue to iterate
        return look(from: self.index(before: ind), for: String(sample.dropLast()))
    }
    
    func find(_ str: String) -> Index? {
        var currentIndex = self.index(self.startIndex, offsetBy: str.count - 1)
        guard str.count > 0 else { return nil }
    
        while currentIndex != self.endIndex {
            
            print(self[currentIndex], "ITERATION")
            
            if self[currentIndex] == str.last {
                if let result = self.look(from: currentIndex, for: str) { return result }
                currentIndex = self.index(after: currentIndex)
            } else {
                print("GAPPING FROM \(self[currentIndex]) BY \(str.skipList[self[currentIndex]] ?? str.count)")
                currentIndex = self.index(currentIndex, offsetBy: str.skipList[self[currentIndex]] ?? str.count, limitedBy: endIndex) ?? endIndex
            }
        }
        
    return nil
    }
}

/*
let sample = "CGTGCCTACTTACTTACTTACTTACGCGAA"
let toFind = "CTTACTTAC"
 */

let sample = "This is a test"
let toFind = "test"
let result = sample.find(toFind)!

// ----------------------------
print("SEARCHING FOR:    \(toFind) \nRESULT:           ", terminator: "")
for char in sample.indices {
    if char == result { print("(\(sample[char]))", terminator: "") } else { print(sample[char], terminator: "") }
}
print("\n\n")

/*
 s ITERATION
 GAPPING FROM s BY 1
   ITERATION
 GAPPING FROM   BY 4
 a ITERATION
 GAPPING FROM a BY 4
 s ITERATION
 GAPPING FROM s BY 1
 t ITERATION
 Comparing t and test <-
 Comparing s and tes <-
 Comparing e and te <-
 Comparing t and t <-
 SEARCHING FOR:    test
 RESULT:           This is a (t)est
 */

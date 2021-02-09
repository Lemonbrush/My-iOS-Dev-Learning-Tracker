// Counting Sort
func cSort(_ arry: inout [Int]) {
    let arMax = arry.max() ?? 0
    
    var countArry = [Int](repeating: 0, count: arMax + 1) // Taking into consideration 0 index
    
    // Counting values
    for value in arry {
        countArry[value] += 1
    }
    
    // Summing every previous
    for i in stride(from: 1, to: countArry.count, by: 1) {
        countArry[i] += countArry[i - 1]
    }
    
    // Replacing
    for i in stride(from: countArry.count - 1, to: 0, by: -1) {
        arry[countArry[i] - 1] = i
    }
}

var testArr = [ 10, 9, 8, 7, 1, 2, 7, 3 ]
print("TO SORT: ",testArr)
cSort(&testArr)
print("RESULT:  ",testArr)

/*
 TO SORT:  [10, 9, 8, 7, 1, 2, 7, 3]
 RESULT:   [1, 2, 3, 7, 7, 8, 9, 10]
 */

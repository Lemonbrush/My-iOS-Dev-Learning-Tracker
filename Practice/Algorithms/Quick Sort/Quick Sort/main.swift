// Quick Sort algorithm

/*
 The simpliest form of the algorithm
 
func qSort(_ arry: [Int]) -> [Int] {
    guard arry.count > 1 else { return arry }
    let pivot = arry[arry.count/2]
    
    var less = [Int]()
    for value in arry {
        if value < pivot { less.append(value) }
    }
    
    var equal = [Int]()
    for value in arry {
        if value == pivot { equal.append(value) }
    }
    
    var greater = [Int]()
    for value in arry {
        if value > pivot { greater.append(value) }
    }
    
    return qSort(less) + equal + qSort(greater)
}

var testArr = [10, 1, 5, 3, 7, 0, 9, 2, 4, 6, 8]
print(qSort(testArr))
*/

// Lomuto partition scheme

func partitionLomuto(_ arry: inout [Int], low: Int, high: Int) -> Int {
    let pivot = arry[high]
    
    /*
     [ values <= pivot | values > pivot | not looked at yet | pivot ]
       low           i   i+1        j-1   j          high-1   high
     
     low                                      high
      0   1  2  3  4  5   6   7   8  9  10  11  12
      |                                         |
     [10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, (8)]
                                                |
                                              pivot
     
     
     [ 0, 3, 2, 1, 5, 8, -1 | 27, 9, 10, 14, 26 | 8 ]
       low                                        high
                              i                   j
     
     and finally swap
     
     [ 0, 3, 2, 1, 5, 8, -1 | 8 | 9, 10, 14, 26, 27 ]
       low                                       high
                              i                  j
     
     

                low                  high
     [0, 3, 2, 1, 5, 8, -1 | 27, 9, 10, 14, 26 | 8]
                             i
                                            j
     
                low                  high
     [0, 3, 2, 1, 5, 8, -1 | 8 | 9, 10, 14, 26, 27]
     
     [-1 | 3, 2, 1, 5, 8, 0 ]
     
         [ 0 | 2, 1, 5, 8, 3 ]
     
             [ 2, 1, 3 | 8, 5]
     */
    
    var i = low // the last index of the high set
    for j in low..<high {
        if arry[j] <= pivot {
            arry.swapAt(i, j) // add the value to the low set
            i += 1 // and swith to the next value which is located into the high set
        }
    }
    
    arry.swapAt(i, high)
    return i
}

func qSortLomuto(_ arry: inout [Int], low: Int, high: Int) {
    guard low < high else { return }
    
    let pivot = partitionLomuto(&arry, low: low, high: high)
    qSortLomuto(&arry, low: low, high: pivot - 1)
    qSortLomuto(&arry, low: pivot + 1, high: high)
}

//var list = [10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8]
//qSortLomuto(&list, low: 0, high: list.count - 1)
//print(list)

// Hoare's partition scheme

func partitionHoare(_ a: inout [Int], low: Int, high: Int) -> Int {
    let pivot = a[low] //the first element
    var i = low - 1
    var j = high + 1
    
    while true {
        repeat { j -= 1 } while a[j] > pivot // Keep all the high numbers on the right
        repeat { i += 1 } while a[i] < pivot // Keep all the lowest numbers on the left
        
        // check iterators' intersection
        if i < j { a.swapAt(i, j) } else { return j }  // Swap differences or return the final
    }
    
    /*
     pivot = 8
     
          low set                      high set
     [ 8, 0, 3, 9, 2, 14, 10, 27, 1, 5, 8, -1, 26 ]
       i                                    j
     --->                                    <---
     */
}

func qSortHoare(_ a: inout [Int], low: Int, high: Int) {
    guard low <  high else { return }
    
    let pivot = partitionHoare(&a, low: low, high: high)
    qSortHoare(&a, low: 0, high: pivot - 1)
    qSortHoare(&a, low: pivot + 1, high: high)
}

var list = [10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8]
qSortHoare(&list, low: 0, high: list.count - 1)
print(list)

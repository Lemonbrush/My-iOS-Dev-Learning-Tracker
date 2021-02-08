// Merge Sort algorithm

func smerge(_ left: [Int], _ right: [Int]) -> [Int] {
    var result = [Int]()
    
    var leftIter = 0
    var rightIter = 0
    
    while leftIter < left.count && rightIter < right.count {
        
        print("MERGING \(left[leftIter]) ind \(leftIter) - \(right[rightIter]) ind \(rightIter)")
        
        if left[leftIter] < right[rightIter] {
            result.append(left[leftIter])
            leftIter += 1
        } else if left[leftIter] > right[rightIter] {
            result.append(right[rightIter])
            rightIter += 1
        } else {
            result.append(left[leftIter])
            result.append(right[rightIter])
            leftIter += 1
            rightIter += 1
        }
    }
    
    // Add the rest of one of the arrays
    while leftIter < left.count {
        result.append(left[leftIter])
        leftIter += 1
    }
    
    while rightIter < right.count {
        result.append(right[rightIter])
        rightIter += 1
    }
    
    print("MERGE \(left) AND \(right)\nMERGE RESULT: \(result)\n")
    return result
}

func mSort(_ arry: [Int]) -> [Int] {
    
    if arry.count > 1 {
        let splitter = arry.count / 2
        
        let leftArry = Array(arry[0...splitter - 1])
        let rightArry = Array(arry[leftArry.count...arry.count - 1])
        
        print("----------\nBEFORE: \(arry)\nLeft arr - \(leftArry)\nRight arr - \(rightArry)\n----------\n")
        
        let result = smerge(mSort(leftArry), mSort(rightArry))
        
        return result
    } else {
        return arry
    }
}

print(mSort([1, 3, 5, 2, 7, 9, 8, 4, 6, 0, 99]))

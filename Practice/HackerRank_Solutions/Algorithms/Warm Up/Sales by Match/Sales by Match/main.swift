/*
 There is a large pile of socks that must be paired by color. Given an array of integers representing the color of each sock, determine how many pairs of socks with matching colors there are.
 
 Function Description
 Complete the sockMerchant function in the editor below.
 sockMerchant has the following parameter(s):
 int n: the number of socks in the pile
 int ar[n]: the colors of each sock
 
 Returns
 int: the number of pairs
 
 */

func sockMerchant(n: Int, ar: [Int]) -> Int {
    var result = 0
    var setObserver = Set<Int>()
    for val in ar {
        if !setObserver.contains(val) {
            setObserver.insert(val)
        } else {
            setObserver.remove(val)
            result += 1
        }
    }
    
    return result
}

print(sockMerchant(n: 9, ar: [10, 20, 20, 10, 10, 30, 50, 10, 20]))

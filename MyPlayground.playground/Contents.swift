func mergeSort(_ unsorted: [Int]) -> [Int] {
    if unsorted.count <= 1 {
        return unsorted
    }
    let middleIndex = unsorted.count / 2
    let lhs = Array(unsorted[0..<middleIndex])
    let rhs = Array(unsorted[middleIndex..<unsorted.count])
    return merge(mergeSort(lhs), mergeSort(rhs))
}

func merge(_ lhs: [Int], _ rhs: [Int]) -> [Int] {
    var sorted: [Int] = []
    var leftIndex = 0
    var rightIndex = 0
    while leftIndex < lhs.count || rightIndex < rhs.count {
        
        if rightIndex == rhs.count {
            sorted.append(lhs[leftIndex])
            leftIndex += 1
        } else if leftIndex == lhs.count {
            sorted.append(rhs[rightIndex])
            rightIndex += 1
        } else if lhs[leftIndex] <= rhs[rightIndex] {
            sorted.append(lhs[leftIndex])
            leftIndex += 1
        } else if rhs[rightIndex] < lhs[leftIndex] {
            sorted.append(rhs[rightIndex])
            rightIndex += 1
        }
    }
    return sorted
}

var unsortedList: [Int] = [42, 13, 4, 5, 12, 67, 66, 77, 88, 99, 4, -1]
print(mergeSort(unsortedList))

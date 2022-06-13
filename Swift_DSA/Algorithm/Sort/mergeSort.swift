import Foundation


// mergeSort
// 반으로 다 쪼갠 후에 원소의 첫번째 원소를 비교해가며 작은 것이 왼쪽이 오도록 정렬한다.
func mergeSort2(_ array: [Int]) -> [Int] {
    if array.count <= 1 { return array }
    // left: 배열을 반으로 가른 것의 왼쪽 부분
    // right: 배열을 반으로 가른 것의 오른쪽 부분
    let left = Array(array[0..<array.count/2])
    let right = Array(array[array.count/2..<array.count])

    func merge2(_ left: [Int], _ right: [Int]) -> [Int] {
        var left = left
        var right = right
        var result: [Int] = []

        // 왼쪽 배열과 오른쪽 배열이 모두 비어있지 않다면
        while !left.isEmpty && !right.isEmpty {
            if left[0] < right[0] {
                result.append(left.removeFirst())
            }
            else {  // left[0] >= right[0]
                result.append(right.removeFirst())
            }
        }
        // 한쪽만 남은 경우
        if !left.isEmpty {  // 왼쪽만 남아있는경우 남은거 다 추가
            result.append(contentsOf: left)
        }
        if !right.isEmpty {  // 오른쪽만 남아있는경우 남은거 다 추가
            result.append(contentsOf: right)
        }
        return result   // 합병이 끝난 결과
    }
    return merge2(mergeSort2(left), mergeSort2(right))
}


print(mergeSort2([1,5,4,3,49,2,50,6]))

/*
func merge<T: Comparable> (array: inout [T], startIndex: Int, middleIndex: Int, endIndex: Int) {
    let leftSubarray = Array(array[startIndex...middleIndex])
    let rightSubarray = Array(array[middleIndex+1...endIndex])

    var index = startIndex
    var leftIndex = 0
    var rightIndex = 0

    while leftIndex < leftSubarray.count && rightIndex < rightSubarray.count {
        if leftSubarray[leftIndex] < rightSubarray[rightIndex] {
            array[index] = leftSubarray[leftIndex]
            leftIndex += 1
        }
        else {
            array[index] = rightSubarray[rightIndex]
            rightIndex += 1
        }
        index += 1
    }

    while leftIndex < leftSubarray.count {
        array[index] = leftSubarray[leftIndex]
        index += 1
        leftIndex += 1
    }

    while rightIndex < rightSubarray.count {
        array[index] = rightSubarray[rightIndex]
        index += 1
        rightIndex += 1
    }
}

func mergeSort<T: Comparable>(array: inout [T], startIndex: Int, endIndex: Int) {
    // Base case
    if startIndex >= endIndex {
        return
    }

    let middleIndex = (startIndex + endIndex) / 2
    mergeSort(array: &array, startIndex: startIndex, endIndex: middleIndex)
    mergeSort(array: &array, startIndex: middleIndex+1, endIndex: endIndex)
    merge(array: &array, startIndex: startIndex, middleIndex: middleIndex, endIndex: endIndex)
}

func mergeSort<T: Comparable>(array: inout [T]) {
    mergeSort(array: &array, startIndex: 0, endIndex: array.count-1)
}

var numbers = [13, 77, 20, 45, 2, 15, 0, 59, 5, 68, 51, 1, -1, 77]
mergeSort(array: &numbers)

print(numbers)
// https://medium.com/@notestomyself/merge-sort-in-swift-ae33679251e7
*/

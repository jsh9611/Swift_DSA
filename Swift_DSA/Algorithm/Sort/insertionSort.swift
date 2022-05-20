import Foundation
// 삽입정렬
func insertionSort(_ array: [Int]) -> [Int] {
    var sortedArray = array
    for index in 1..<sortedArray.count {
        var currentIndex = index
        let temp = sortedArray[currentIndex]
        // index까지 모든 원소에 대해 크기를 비교하고 Swap한다.
        while currentIndex > 0 && temp < sortedArray[currentIndex - 1] {
          sortedArray[currentIndex] = sortedArray[currentIndex - 1]
          currentIndex -= 1 // 삽입할 index를 찾기 위해 사용
        }
        sortedArray[currentIndex] = temp    // 해당 index에 삽입한다.
  }
  return sortedArray
}

let dumy_list = [8,3,4,1,5,2,9]

print(insertionSort(dumy_list))

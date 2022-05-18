import Foundation

//print("Hello, World!")

// 양의 정수 n을 n번 더하는 계산 해보자 //
/* Case 1 */
func example1(n: Int) -> Int{
    var answer = 0

    // Case 1
    answer = n * n          // O(1)

    // Case 2
    answer = 0
    for i in 1...n {        // O(n)
        answer = answer + i
    }

    // Case 3
    answer = 0
    for i in 1...n {        // O(n^2)
        for j in 1...n {
            answer = answer + 1
        }
    }
    return answer
}
print(example1(n: 10))

// 시간복잡도 생각해보기
// f(n) = T(4n+5) = O(n)
func example2(n: Int) -> Int {
    var sum = 0 // 대입연산 1회
    var i = 0   // 대입연산 1회
    
    for i in 0..<n {    // 반복문 n+1회
        sum += i        // 덧셈연산 n회
    }
    for i in 0..<n {     // 반복문 n+1회
        sum += i        // 덧셈 연산 n회
    }
    return sum  // 리턴 1회
}
print(example2(n: 10))

// 공간복잡도 생각해보기
func example3(arr: [Int], n: Int) -> Int {
    var x = 0
    for i in 0..<n {
        x = x + arr[i]
    }
    return x
}
print(example3(arr: [1,2,3,4,5], n: 5))
/*
 var arr : [Int] (4*n byte 입력 공간)
 var n : Int     (4 byte 입력 공간)
 var x : Int     (4 byte 보조 공간)
 var i : Int     (4 byte 보조 공간)
 총 4n + 12의 메모리를 요구한다.
 따라서 공간 복잡도는 O(n)
 */

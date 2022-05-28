import Foundation

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

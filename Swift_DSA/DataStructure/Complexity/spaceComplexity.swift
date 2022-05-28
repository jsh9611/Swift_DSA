import Foundation

// 공간복잡도 생각해보기
// arr에 들어있는 모든 원소의 합을 구한다
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

// 팩토리얼 구하기
// n이 1이 될 때 까지 재귀적으로 함수가 호출된다.
// 스택에는 n부터 1까지가 모두 쌓이게 된다.
// 따라서 공간복잡도는 O(n)
func factorial(n: Int) -> Int {
    if n > 1 {
        return n * factorial(n: n - 1)
    }
    else { return 1 }
}

// 팩토리얼 구하기2
// n의 값과 상관없이 스택에는 n과, i, fac 변수만 저장된다.
// 따라서 공간복잡도는 O(1)
func factorial2(n: Int) -> Int {
    var fac = 1
    for i in 1...n {
        fac = fac * i
    }
    return fac
}

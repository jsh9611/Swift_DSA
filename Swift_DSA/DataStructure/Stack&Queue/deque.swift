//
//  deque.swift
//  Swift_DSA
//
//  Created by SeongHoon Jang on 2022/06/12.
//

import Foundation

//MARK: - Deque(Array)
class Deque<T: Equatable> {
    var enqueue: [T]
    var dequeue: [T] = []
    var count: Int {
        return enqueue.count + dequeue.count
    }
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    var first: T? {
        if dequeue.isEmpty {
            return enqueue.first
        }
        return dequeue.last
    }
    init(_ queue: [T]) {
        enqueue = queue
    }
    func pushFirst(_ n: T) {
        dequeue.append(n)
    }
    func pushLast(_ n: T) {
        enqueue.append(n)
    }
    func popFirst() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()    //  reversed(): O(1)
            enqueue.removeAll()             //  removeAll(): O(N)
        }
        return dequeue.popLast()
        
    }
    func popLast() -> T? {
        var returnValue: T?
        if enqueue.isEmpty {
            dequeue.reverse()
            returnValue = dequeue.popLast()
            dequeue.reverse()
        } else {
            returnValue = enqueue.popLast()
        }
        return returnValue
    }
    func contains(_ n: T) -> Bool {
        return enqueue.contains(n) || dequeue.contains(n)   // contains(x): O(N)
    }
    func removeAll() {
        enqueue.removeAll()
        dequeue.removeAll()
    }
}

// 출처: https://icksw.tistory.com/213 [PinguiOS:티스토리]

// 참고: 배열 하나로 deque 구현
// https://blog.5anniversary.dev/29

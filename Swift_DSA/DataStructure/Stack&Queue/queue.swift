//
//  queue.swift
//  Swift_DSA
//
//  Created by SeongHoon Jang on 2022/06/12.
//

import Foundation

//MARK: - Node
class Node<T> {
  var data: T
  var next: Node?
  init(data: T) {
    self.data = data
  }
}

//MARK: - Queue(Linked List)
class Queue<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var count: Int = 0
    
    // 리스트 마지막에 새로운 노드를 추가
    func enqueue(data: T) {
        let newNode = Node(data: data)
        if let tailNode = tail {
            tailNode.next = newNode
            newNode.next = nil
            tail = newNode
        } else {
            head = newNode
            tail = newNode
        }
        count += 1
    }
    
    // 리스트의 첫번째의 노드를 제거
    func dequeue() -> Node<T>? {
        if let node = head {
            head = head?.next
            count -= 1
            return node
        }
        return nil
    }
}

var queue = Queue<Int>()
queue.enqueue(data: 50)
queue.enqueue(data: 20)
queue.enqueue(data: 70)

// Queue의 길이 출력
print(queue.count)

// FIFO(선입 선출)
// Queue에 들어있는 원소들을 하나씩 dequeue한다.
while let temp = queue.dequeue() {
    print(temp.data)
}

//MARK: - 참고
// https://swiftbyshanks.medium.com/stack-and-queue-implementation-with-linkedlist-in-swift-b16c69e1e0dc

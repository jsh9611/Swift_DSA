//
//  stack_linkedList.swift
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

//MARK: - Stack(Linked List)
class Stack<T> {
    var head: Node<T>?
    var count: Int = 0
    
    // 리스트의 마지막에 노드를 추가
    func push(data: T) {
        let node = Node<T>(data: data)
        if let headNode = head  {
            node.next = headNode
        }
        head = node
        count += 1
    }
    
    // 제일 마지막에 있는 노드를 제거
    func pop() -> Node<T>? {
        if let headNode = head {
            let node = headNode
            head = headNode.next
            node.next = nil
            count -= 1
            return node
        }
        return nil
    }
    
    // 가장 뒤에 있는 노드를 반환
    func peek() -> Node<T>? {
        return head
    }
}

var stack = Stack<Int>()
stack.push(data: 50)
stack.push(data: 60)
stack.push(data: 70)
stack.push(data: 20)

// Stack의 길이 출력
print(stack.count)

// 마지막 Node를 출력
print((stack.peek()?.data)!)

// LIFO(후입선출)
// Stack에 들어있는 원소들을 하나씩 Pop한다.
while let temp = stack.pop() {
    print(temp.data)
}

//MARK: - 참고
// https://swiftbyshanks.medium.com/stack-and-queue-implementation-with-linkedlist-in-swift-b16c69e1e0dc

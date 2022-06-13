//
//  OneWayLinkedList.swift
//  Swift_DSA
//
//  Created by SeongHoon Jang on 2022/06/12.
//

import Foundation

//MARK: - Node 정의
class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
//MARK: - LinkedList<T: Equatable>
// 제네릭으로 선언되어 있어 자료형을 런타임 전까지 모르고,
// Equatable이란 프로토콜이 채택되지 않은 자료형이 들어올 수 있기 때문에
// LinkedList 클래스에 Equatable 프로토콜을 채택해줘야한다.
class LinkedList<T: Equatable> {
    private var head: Node<T>?
    
    // 맨 뒤에 노드 추가
    func append(data: T?) {
        // head가 없다면 Node를 생성하고 head로 지정한다
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        // next가 nil이 나올 때 까지 돈 뒤에 추가한다.
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
    }
    
    // 중간에 노드 추가
    func insert(data: T?, at index: Int) {
        // head가 없다면 Node를 생성하고 head로 지정한다
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        for _ in 0..<(index-1) {
            if node?.next == nil { break } // index가 node 범위를 넘어가면 맨 마지막에 추가한다.
            node = node?.next
        }
        let tempNode = node?.next
        node?.next = Node(data: data)
        node?.next?.next = tempNode
        
    }
    
    // 중간에 있는 노드 제거
    func remove(at index: Int) {
        if head == nil { return }
        
        // head를 삭제하는 경우
        if index == 0 || head?.next == nil {
            head = head?.next
            return
        }
        
        var node = head
        for _ in 0..<(index-1) {
            if node?.next?.next == nil { break }
            node = node?.next
        }
        node?.next = node?.next?.next
    }
    
    // data에 해당하는 노드를 찾아준다.
    // 없으면 nil 반환
    func searchNode(from data: T?) -> Node<T>? {
        if head == nil { return nil }
        
        var node = head
        while node?.next != nil {
            if node?.data == data { break }
            node = node?.next
        }
        if node?.data != data { return nil }
        return node
    }
    
    // 맨 뒤의 노드를 제거
    func removeLast() {
        if head == nil { return }
        
        if head?.next == nil {
            head = nil
            return
        }
        
        var node = head
        while node?.next?.next != nil {
            node = node?.next
        }
        
        node?.next = node?.next?.next
    }
    
    // 전부 다 출력
    func printAll() {
        if head == nil { return }
        
        var node = head
        while node != nil {
            print((node?.data)!)
            node = node?.next
        }
    }
    
}



var temp = LinkedList<Int>()
temp.append(data: 5)
temp.append(data: 30)
temp.append(data: 4)
temp.append(data: 60)
temp.append(data: 7)
temp.append(data: 80)
//print(temp)
//temp.removeLast()
temp.printAll()

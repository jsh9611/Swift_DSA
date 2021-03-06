import Foundation

class Node {
   var data: Int
   var left: Node?
   var right: Node?
   init(data: Int) {
      self.data = data
   }
}

func preOrderTraversal(node: Node?) {
    guard let node = node else { return }
    print(node.data, terminator: " ")
    preOrderTraversal(node: node.left)
    preOrderTraversal(node: node.right)
}

func inOrderTraversal(node: Node?) {
    guard let node = node else { return }
    inOrderTraversal(node: node.left)
    print(node.data, terminator: " ")
    inOrderTraversal(node: node.right)
}

func postOrderTraversal(node: Node?) {
    guard let node = node else { return }
    postOrderTraversal(node: node.left)
    postOrderTraversal(node: node.right)
    print(node.data, terminator: " ")
}

// 트리 생성
var root = Node(data: 1)
root.left = Node(data: 2)
root.left?.left = Node(data: 4)
root.left?.right = Node(data: 5)
root.left?.left?.left = Node(data: 7)
root.right = Node(data: 3)
root.right?.right = Node(data: 6)
root.right?.right?.left = Node(data: 8)
root.right?.right?.right = Node(data: 9)

// 전위 순회
print("PreOrderTraversal: ")
preOrderTraversal(node: root)
print("\n")

// 중위 순회
print("inOrderTraversal: ")
inOrderTraversal(node: root)
print("\n")

// 후위 순회
print("postOrderTraversal: ")
postOrderTraversal(node: root)
print("\n")

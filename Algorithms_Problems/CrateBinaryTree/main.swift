//
//  main.swift
//  CrateBinaryTree
//
//  Created by chandra sekhar p on 20/08/24.
//

/*
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(val: Int) { self.val = val; self.left = nil; self.right = nil; }
}

public class Queue<T> {
    var array: [T] = []
    var isEmpty: Bool { return array.isEmpty }
    func enqueue(_ element: T) { array.append(element)}
    var deQueue: T? { isEmpty ? nil: array.removeFirst() }
    var peek: T? { return array.first }
}

public class BTree {
    public func rootNode(_ data: [Int]) -> TreeNode? {
        if data.count == 0 { return nil }
        let addressQueue: Queue<TreeNode> = Queue()
        let rootNode: TreeNode = TreeNode(val: data.first!)
        let p: TreeNode = rootNode
        addressQueue.enqueue(p)
        var dataIndex = 1
        while (!addressQueue.isEmpty) {
            guard let tempRoot = addressQueue.deQueue, dataIndex < data.count else { break }
            let lValue = data[dataIndex]
            if lValue != -1 {
                let left = TreeNode(val: lValue)
                tempRoot.left = left
                addressQueue.enqueue(left)
            }
            dataIndex += 1
            if data.count > dataIndex {
                let rValue = data[dataIndex]
                if rValue != -1 {
                    let right = TreeNode(val: rValue)
                    tempRoot.right = right
                    addressQueue.enqueue(right)
                }
            }
            
            dataIndex += 1
        }
        return rootNode
    }
}

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var result: [Int] = []
    inOrder(result: &result, node: root)
    return result
}

func inOrder(result: inout [Int], node: TreeNode?) {
    if let node {
        inOrder(result: &result, node: node.left)
        result.append(node.val)
        inOrder(result: &result, node: node.right)
    }
}

func preOrderTraversal(_ result: inout [Int], node: TreeNode?) {
    guard let node else { return }
    print(node)
    result.append(node.val)
    preOrderTraversal(&result, node: node.left)
    preOrderTraversal(&result, node: node.right)
}

func postOrderTraversal(_ result: inout [Int], node: TreeNode?) {
    guard let node else { return }
    print(node)
    preOrderTraversal(&result, node: node.left)
    preOrderTraversal(&result, node: node.right)
    result.append(node.val)
}

// Breadth First Search or levelOrderTraversal
func levelOrderTraversal(_ result: inout [Int], node: TreeNode?) {
    
    let queue: Queue<TreeNode> = Queue()
    guard let node else { return }
    queue.enqueue(node)
    
    while(!queue.isEmpty) {
        guard let tempNode = queue.deQueue else { break }
        result.append(tempNode.val)
        if let left = tempNode.left {
            queue.enqueue(left)
        }
        if let right = tempNode.right {
            queue.enqueue(right)
        }
    }
    
//    guard let node else { return }
//    print(node)
//    if result.count == 0 {
//        result.append(node.val)
//    }
//    if let left = node.left {
//        result.append(left.val)
//    }
//    if let right = node.right {
//        result.append(right.val)
//    }
//    
//    preOrderTraversal(&result, node: node.left)
//    preOrderTraversal(&result, node: node.right)
}

let input = [1,-1,2,3]
let root = BTree().rootNode(input)
print(inorderTraversal(root))

let levelInput = [1, 2, 3, -1, 5, 6, 7, 8]
let tree = BTree().rootNode(levelInput)
var result: [Int] = []
levelOrderTraversal(&result, node: tree)
print(result)

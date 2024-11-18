//
//  Node.swift
//  LinkedList
//
//  Created by chandra sekhar p on 08/07/24.
//

import Foundation

class Node<T: Equatable> {
    
    let data: T
    var next: Node?
    
    init(data: T) {
        self.data = data
    }
}

class LinkedList<T: Equatable> {
    
    var head: Node<T>?
    private var lastNode: Node<T>?
    
    public func addElement(item: T) {
        let node = Node(data: item)
        guard let lastNode else {
            head = node
            lastNode = node
            return
        }
        lastNode.next = node
        self.lastNode = node
    }
    
    public func addFirst(item: T) {
        let node = Node(data: item)
        guard let head else {
            head = node
            lastNode = node
            return
        }
        node.next = head
        self.head = node
    }
    
    public func deleteElement(item: T) -> Bool {
        guard let head else { return false }
        if head.data == item {
            self.head = head.next
            return true
        }
        if let nextNode = head.next {
           let result = self.deleteNode(shadow: head, next: nextNode, item: item)
            printList()
            return result
        }
        return false
    }
    
    private func deleteNode(shadow: Node<T>, next: Node<T>?, item: T) -> Bool {
        if let next {
            if next.data == item { 
                shadow.next = next.next
                return true
            }
            return deleteNode(shadow: next, next: next.next, item: item)
        }
        else {
            return false
        }
    }
    
    private func printList() {
        var currentNode = head
        while let _currentNode = currentNode {
            print("\(_currentNode.data)", terminator: "")
            currentNode = _currentNode.next
            print(currentNode != nil ? " -> " :  " -> nil ", terminator: "")
        }
        print("")
    }
}


extension LinkedList {
    
    func reverseList() {
        printList()
        reverseWithSlidingWindow()
        //reverse(mainNode: head)
        printList()
    }
    
    func createLoop() {
        self.lastNode?.next = head
    }
    
    func checkIsLoop() -> Bool {
        
        var slowNode: Node<T>? = head
        var fastNode: Node<T>? = head
        var count = 1
        
        while slowNode != nil && fastNode != nil {
            slowNode = slowNode?.next
            fastNode = fastNode?.next?.next
            print(slowNode?.data ?? 0, terminator: " ")
            print(fastNode?.data ?? 0, terminator: "")
            print("")
            if slowNode === fastNode {
                print(count)
                return true
            }
            else {
              count += 1
            }
        }
        return false
    }
}

extension LinkedList {
    private func reverse(tailingNode: Node<T>? = nil, mainNode: Node<T>?) {
        if mainNode?.next != nil {
            reverse(tailingNode: mainNode, mainNode: mainNode?.next)
        }
        else {
            self.head = mainNode
        }
        mainNode?.next = tailingNode
    }
    
    private func reverseWithSlidingWindow() {
        var p: Node<T>? = nil
        var q: Node<T>? = head
        var r: Node<T>? = head?.next
        
        while q != nil {
            q?.next = p
            p = q
            q = r
            r = r?.next
        }
        head = p
    }
}

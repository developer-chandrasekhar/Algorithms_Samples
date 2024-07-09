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
    
    private var head: Node<T>?
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
            printList(node: head)
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
    
    private func printList(node: Node<T>) {
        print(node.data)
        if let _node = node.next {
            printList(node: _node)
        }
    }
}


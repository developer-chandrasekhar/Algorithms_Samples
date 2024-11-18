//
//  main.swift
//  LinkedList
//
//  Created by chandra sekhar p on 08/07/24.
//

import Foundation


func prepare() {
    
    let list: LinkedList<Int> = createList(dataArray: [2, 4, 5, 7, 8, 9])
    let list2: LinkedList<Int> = createList(dataArray: [3, 6, 6, 8, 11, 13])
    
    
    let final = mergeTwoSortedLinkedList(list1: list, list2: list2)
    
    //list.createLoop()
    //print(list.checkIsLoop())
    //list.reverseList()
}

func createList<T: Equatable>(dataArray: [T]) -> LinkedList<T> {
    let list = LinkedList<T>()
    dataArray.forEach { data in
        list.addElement(item: data)
    }
    return list
}

prepare()



func mergeTwoSortedLinkedList(list1: LinkedList<Int>, list2: LinkedList<Int>) -> LinkedList<Int> {
    
    var p: Node<Int>? = list1.head
    var q: Node<Int>? = list2.head
    
    var finalList = list1
    
    if  p == nil { return list2 }
    if  q == nil { return list1 }
        
    var r: Node<Int>? = p
    
    if let _p = p, let _q = q,  _p.data > _q.data {
        r = q
        q = q?.next
        finalList = list2
    }
    else {
        p = p?.next
    }
    
    finalList.head = r
        
    let assign: (Node<Int>?) -> Void = { node in
        r?.next = node
        r = r?.next
    }
    
    while(p != nil || q != nil) {
        if let _p = p, let _q = q {
            if _p.data < _q.data {
                assign(_p)
                p = p?.next
            }
            else {
                assign(_q)
                q = q?.next
            }
        }
        else if p != nil {
            assign(p)
            p = nil
        }
        else {
            assign(q)
            q = nil
        }
    }
    return finalList
}


func middleElementOfLinkedList(list: LinkedList<Int>) {
    
}


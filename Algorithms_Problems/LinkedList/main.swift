//
//  main.swift
//  LinkedList
//
//  Created by chandra sekhar p on 08/07/24.
//

import Foundation


func prepare() {
    let list = LinkedList<Int>()
    list.addElement(item: 3)
    list.addElement(item: 4)
    list.addElement(item: 6)
    list.addElement(item: 7)
    list.addElement(item: 8)
    list.addElement(item: 9)
    list.createLoop()
    print(list.checkIsLoop())
    //list.reverseList()
}

prepare()


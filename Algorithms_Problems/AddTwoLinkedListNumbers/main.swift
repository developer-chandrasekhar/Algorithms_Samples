//
//  main.swift
//  AddTwoLinkedListNumbers
//
//  Created by chandra sekhar p on 23/07/24.
//

import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

var preparedList: ListNode?

func prepareNumberNode(numberArray: [Int]) -> ListNode? {
    
    var head: ListNode?
    var next: ListNode?
//    if numberArray.count == 0 {
//        return ListNode(0)
//    }
    
    for i in 0..<numberArray.count {
        let child = ListNode(numberArray[i])
        if next == nil {
            next = child
            head = next
        }
        else {
            next?.next = child
            next = child
        }
    }
    return head
}

func prepareList(numberArray: [Int]) -> ListNode? {
    
    var head: ListNode?
    var next: ListNode?
    
    for i in 1...numberArray.count {
        let child = ListNode(numberArray[numberArray.count - i])
        if next == nil {
            next = child
            head = next
        }
        else {
            next?.next = child
            next = child
        }
    }
    return head
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil && l2 == nil { return nil }
    var tempL1 = l1
    var tempL2 = l2
    var finalArray: [Int] = []
    var remainder = 0

    let calculate: (Int, Int) -> Void = { val1, val2 in
        let sum = val1 + val2 + remainder
        remainder = Int(floor(Double(sum/10)))
        finalArray.append(sum%10)
    }
    
    while (tempL1 != nil || tempL2 != nil) {
        let l1val = tempL1?.val ?? 0
        tempL1 = tempL1?.next
        let l2val = tempL2?.val ?? 0
        tempL2 = tempL2?.next
        calculate(l1val, l2val)
    }
    
    if remainder > 0 {
        finalArray.append(remainder)
    }
    
    let result = prepareList(numberArray: finalArray)
    return result
}

//func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//    if l1 == nil && l2 == nil { return nil }
//    var finalArray: [Int] = []
//    
//    guard let l1 else {
//        parseL2(finalArray: &finalArray, node: l2!)
//        let result = prepareList(numberArray: finalArray)
//        return result
//    }
//    
//    guard let l2 else {
//        parseL2(finalArray: &finalArray, node: l1)
//        let result = prepareList(numberArray: finalArray)
//        return result
//    }
//    parseL1(head: &preparedList, node: l1, next: nil)
//    parseL2(finalArray: &finalArray, node: l2)
//    
//    while (preparedList != nil) {
//        if let _preparedList = preparedList {
//            let sum = _preparedList.val + remainder
//            preparedList = preparedList?.next
//            finalArray.append(sum % 10)
//            remainder = Int(floor(Double(sum/10)))
//        }
//    }
//    if remainder > 0 {
//        finalArray.append(remainder)
//    }
//    print(finalArray)
//    let result = prepareList(numberArray: finalArray)
//    return result
//}

//func parseL1(head: inout ListNode?, node: ListNode, next: ListNode?) {
//    if let _node = node.next {
//        parseL1(head: &head, node: _node, next: node)
//        node.next = next
//    }
//    else {
//        head = node
//        head?.next = next
//    }
//}


//func parseL2(finalArray: inout [Int], node: ListNode) {
//    
//    if let _next = node.next {
//        parseL2(finalArray: &finalArray, node: _next)
//        if let l1Val = preparedList?.val {
//            let sum = l1Val + node.val + remainder
//            preparedList = preparedList?.next
//            finalArray.append(sum % 10)
//            remainder = Int(floor(Double(sum/10)))
//        }
//        else {
//            finalArray.append(node.val)
//        }
//    }
//    else {
//        if let l1Val = preparedList?.val {
//            let sum = l1Val + node.val + remainder
//            preparedList = preparedList?.next
//            finalArray.append(sum % 10)
//            remainder = Int(floor(Double(sum/10)))
//        }
//        else {
//            finalArray.append(node.val)
//        }
//    }
//}

addTwoNumbers(prepareNumberNode(numberArray: [9,4,2]),
            prepareNumberNode(numberArray: [9, 4, 6, 5]))

//func parseL1(mainNode: ListNode) -> (head: ListNode, next: ListNode) {
//    
//    if let _mainNode = mainNode.next {
//        let result = parseL1(mainNode: _mainNode)
//        result.head.next = ListNode(mainNode.val)
//        return (result.head, result.head.next!)
//    }
//    else {
//        return (ListNode(mainNode.val), ListNode(mainNode.val))
//    }
//}




//func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?)  {
//    if l1 == nil && l2 == nil { return }
//    
//    var l1Array: [Int] = []
//    var l2Array: [Int] = []
//    
//    var finalArray: [Int] = []
//
//    if let l1 {
//        numberFromList(&l1Array, node: l1)
//    }
//    if let l2 {
//        numberFromList(&l2Array, node: l2)
//    }
//    
//    var i = 0, j = 0
//    var remainder = 0
//    
//    while (i < l1Array.count && j < l2Array.count) {
//        finalArray
//    }
//   
////    let node = prepareNumberNode(number: number)
////    return node
//}

//func numberFromList(_ output: inout [Int], node: ListNode) {
//
//    if let _node = node.next {
//        numberFromList(&output, node: _node)
//        output.append(node.val)
//    }
//    else {
//        output.append(node.val)
//    }
//}



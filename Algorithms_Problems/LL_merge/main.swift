//
//  main.swift
//  LL_merge
//
//  Created by chandra sekhar p on 29/07/24.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) { self.val = val; self.next = nil; }
}

func linkedList(_ nums: [Int]) -> ListNode? {
    
    var head, last: ListNode?
    
    for val in nums {
        if let head {
            last?.next = ListNode(val)
            last = last?.next
        }
        else {
            last = ListNode(val)
            head = last
        }
    }
    return head
}

// with recursion

func merge(l1: ListNode?, l2: ListNode?) -> ListNode? {
    
    guard let l1 else { return l2 }
    guard let l2 else { return l1 }

    let dummy = ListNode(0)
    var next: ListNode? = dummy
    _merge(finalNode: &next, l1: l1, l2: l2)
//    var finalList: ListNode?
//    var next: ListNode?
//    
//    if l1.val > l2.val {
//        finalList = l2
//        next = l2
//        _merge(finalNode: &next, l1: l1, l2: l2.next)
//    }
//    else {
//        finalList = l1
//        next = l1
//        _merge(finalNode: &next, l1: l1.next, l2: l2)
//    }
    return dummy.next
}

func _merge(finalNode: inout ListNode?, l1: ListNode?, l2: ListNode?) {
    if let _l1 = l1, let _l2 = l2 {
        if _l1.val < _l2.val {
            finalNode?.next = _l1
            finalNode = finalNode?.next
            _merge(finalNode: &finalNode, l1: _l1.next, l2: l2)
        }
        else {
            finalNode?.next = _l2
            finalNode = finalNode?.next
            _merge(finalNode: &finalNode, l1: _l1, l2: l2?.next)
        }
    }
    else {
        finalNode?.next = l1 ?? l2
    }
}

let data1 = linkedList([1, 2, 4])
let data2 = linkedList([1, 3, 4])

let final = merge(l1: data1, l2: data2)


// with loop

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 else { return list2 }
        guard let list2 else { return list1 }
        
        var finalList = list1
        var i: ListNode?  = list1
        var j: ListNode? = list2

        if list1.val > list2.val {
            finalList = list2
            j = j?.next
        }
        else {
            i = i?.next
        }
        var next: ListNode? = finalList
        finalList.next = next

        while(i != nil || j != nil) {
            if let _i = i, let _j = j {
                if _i.val > _j.val {
                    next?.next = j
                    next  = next?.next
                    j = j?.next
                }
                else {
                    next?.next = i
                    next  = next?.next
                    i = i?.next
                }
            }
            else if i == nil {
               next?.next = j
               break
            }
            else {
               next?.next = i
               break
            }
        }

        return finalList
    }
}

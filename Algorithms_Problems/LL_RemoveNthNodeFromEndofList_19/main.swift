//
//  main.swift
//  LL_RemoveNthNodeFromEndofList_19
//
//  Created by chandra sekhar p on 26/07/24.
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

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        var currentHead = head
        var finalHead, last: ListNode?
        
        var deletingNode: ListNode?
        var i = 1
        
        while (currentHead != nil) {
            if let _dt = deletingNode {
                if finalHead == nil {
                    finalHead = _dt
                    last = finalHead
                } else {
                    last?.next = _dt
                    last = last?.next
                }
                
                deletingNode = deletingNode?.next
            }
            else if(i == n) {
                deletingNode = head
            }
            i += 1
            currentHead = currentHead?.next
        }
        if last == nil {
            return deletingNode?.next
        }
        last?.next = deletingNode?.next
        return finalHead
    }
}

let data = [1, 2]
let output = Solution().removeNthFromEnd(linkedList(data), 2)


//class Solution {
//    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//        guard let list1 else { return list2 }
//        guard let list2 else { return list1 }
//        
//        var finalList = list1
//        var i: ListNode?  = list1
//        var j: ListNode? = list2
//
//        if list1.val > list2.val {
//            finalList = list2
//            j = j?.next
//        }
//        else {
//            i = i?.next
//        }
//        var next: ListNode? = finalList
//        finalList.next = next
//
//        while(i != nil || j != nil) {
//            if let _i = i, let _j = j {
//                if _i.val > _j.val {
//                    next?.next = j
//                    next  = next?.next
//                    j = j?.next
//                }
//                else {
//                    next?.next = i
//                    next  = next?.next
//                    i = i?.next
//                }
//            }
//            else if i == nil {
//                next?.next = j
//               break
//            }
//            else {
//                next?.next = i
//               break
//            }
//        }
//
//        return finalList
//    }
//}
//
//let data1 = [1, 2, 4]
//let data2 = [1, 3, 4]
//
//print(Solution().mergeTwoLists(linkedList(data1), linkedList(data2)))


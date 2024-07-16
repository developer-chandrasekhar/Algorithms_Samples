//
//  main.swift
//  IndexesOfSum(TwoSum)
//
//  Created by chandra sekhar p on 13/07/24.



//Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
//
//You may assume that each input would have exactly one solution, and you may not use the same element twice.
//
//You can return the answer in any order.
//
// 
//
//Example 1:
//
//Input: nums = [2,11,7,15], target = 9
//Output: [0,1]
//Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
//Example 2:
//
//Input: nums = [3,2,4], target = 6
//Output: [1,2]
//Example 3:
//
//Input: nums = [3,3], target = 6
//Output: [0,1]

import Foundation

//class Solution {
//    
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//       
//        var indexMap: [Int: Int] = [:]
//        
//        for (i, val) in nums.enumerated() {
//            let remaining = target - val
//            if  let pairIndex = indexMap[remaining] {
//                return [pairIndex, i]
//            }
//            indexMap[val] = i
//        }
//        return [0, 0]
//    }
//}
//
//print(Solution().twoSum([3,2,4], 6))

func lengthOfLastWord(_ s: String) -> Int {
    
    var length = 0
    var resetLength = true
    
    for val in s {
        if val == " " { 
            resetLength = true
            continue
        }
        else {
            if resetLength {
                length = 0
                resetLength = false
            }
        }
        length += 1
    }
    return length
}

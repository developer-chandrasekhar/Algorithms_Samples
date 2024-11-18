//
//  main.swift
//  Common
//
//  Created by chandra sekhar p on 31/07/24.
//

import Foundation

extension String{
    subscript(at i: Int) -> Character? {
        return Array(self)[i]
    }
}

//class Solution {
//    func removeDuplicates(_ nums: inout [Int]) -> Int {
//        
//        var index = 0
//        
//        for i in 1..<nums.count {
//            if nums[index] != nums[i] {
//                index += 1
//                nums[index] = nums[i]
//            }
//        }
//        return index
        
//        guard nums.count > 0 else { return 0 }
//        var tempArray: [Int] = []
//        
//        for val in nums {
//           guard let last = tempArray.last, last == val else {
//               tempArray.append(val)
//               continue
//            }
//        }
//        nums = tempArray
        
//        while i < nums.count {
//            if currentNum == nums[i] {
//                nums.remove(at: i)
//            }else {
//               currentNum = nums[i]
//                i += 1
//
//            }
//            count = nums.count
//        }
//        return nums.count
//    }
//}

//var data = [1, 1, 2, 2,2,2, 4]
//print(Solution().removeDuplicates(&data))


/*
 Example 1:
 Input: haystack = "sasadbutsad", needle = "sad"

 Input: haystack = "sadbutsad", needle = "sad"
 Output: 0
 Explanation: "sad" occurs at index 0 and 6.
 The first occurrence is at index 0, so we return 0.
 Example 2:

 Input: haystack = "leetcode", needle = "leeto"
 Output: -1
 Explanation: "leeto" did not occur in "leetcode", so we return -1.
 */


class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        guard haystack.count >= needle.count else { return -1 }
        var i = 0
        let mainStringArray = Array(haystack)
        
        while i < (haystack.count - needle.count) {
            var j = i
            for char in needle {
                if char == character(str: haystack, at: j) {
                    j += 1
                    continue
                }
            }
            if j - i == needle.count {
                return i
            }
            else {
                i += 1
            }
        }
       return -1
    }
    
    func character(str: String, at: Int) -> Character {
        return Array(str)[at]
    }
}

let data = "mississippi"

let obj = Solution()
print(obj.strStr(data, "issipi"))


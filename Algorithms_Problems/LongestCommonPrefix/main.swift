//
//  main.swift
//  LongestCommonPrefix
//
//  Created by chandra sekhar p on 22/07/24.
//

/*
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".

  

 Example 1:

 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 Example 2:

 Input: strs = ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
  

 Constraints:

 1 <= strs.length <= 200
 0 <= strs[i].length <= 200
 strs[i] consists of only lowercase English letters.
 */

import Foundation


func longestCommonPrefix_1(_ strs: [String]) -> String {
    guard var longest = strs.first else { return "" }
    for str in strs {
        var newLongest = ""
        var minCount = min(longest.count, str.count)
        for i in 0..<minCount {
            if Array(longest)[i] == Array(str)[i] {
                newLongest += String(Array(str)[i])
            }
        }
        longest = newLongest
    }
    return longest
}

let strs1 = ["flower","flow","flight", "fit"]
print(longestCommonPrefix_1(strs1))




//func longestCommonPrefix(_ strs: [String]) -> String {
//    
//    var longest = ""
//    if let firstStr = strs.first {
//        longest = firstStr
//    }
//    
//    for (i) in 0..<strs.count - 1 {
//        
//        let str1 = Array(strs[i])
//        let str2 = Array(strs[i + 1])
//        var secondLongest = ""
//        var j = 0
//        while(str1.count > j && str2.count > j) {
//            if str1[j] == str2[j] {
//                secondLongest += String(str1[j])
//                j += 1
//            }
//            else {
//                break
//            }
//        }
//        if secondLongest.count < longest.count {
//            longest = secondLongest
//        }
//    }
//    return longest
//}


func longestCommonPrefix(_ strs: [String]) -> String {
    guard let firstStr = strs.first else { return "" }
    if strs.count == 1 { return firstStr }
    if strs.count == 2 {
        let str1 = Array(strs[0])
        let str2 = Array(strs[1])
        var j = 0
        var longest = ""
        while(str1.count > j && str2.count > j) {
            if str1[j] == str2[j] {
                longest += String(str1[j])
                j += 1
            }
            else {
                break
            }
        }
        return longest
    }
    else {
        let splits: ([String], [String]) = splitArray(array: strs)
        let result1 = longestCommonPrefix(splits.0)
        let result2 = longestCommonPrefix(splits.1)
        return longestCommonPrefix([result1, result2])
    }
}

let strs = ["flower","flow","flight"]
print(longestCommonPrefix(strs))


func splitArray<T>(array: [T]) -> ([T], [T]) {
    let half = array.count / 2 + array.count % 2
    let head = array[0..<half]
    let tail = array[half..<array.count]
    return (Array(head), Array(tail))
}

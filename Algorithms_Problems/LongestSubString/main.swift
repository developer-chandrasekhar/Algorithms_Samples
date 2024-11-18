//
//  main.swift
//  LongestSubString
//
//  Created by chandra sekhar p on 07/07/24.
//

import Foundation

//var mainStr = "jbpnbwwd"
//
//func getLongestSubString() -> Int {
//    let mainString = Array(mainStr)
//    if mainString.count == 0 { return 0 }
//    if mainString.count == 1 { return 1 }
//    var subStringArray: [Character] = Array("")
//    var savedStringArray: [Character] = Array("")
//
//    var movingIndex = 0
//
//    while(movingIndex < mainString.count) {
//        for i in movingIndex..<mainString.count {
//            let char = mainString[i]
//            var isFind = false
//            for j in 0..<subStringArray.count {
//                if subStringArray[j] == char {
//                   isFind = true
//                    break
//                }
//            }
//            if !isFind {
//                subStringArray.append(char)
//            }
//            else {
//                if savedStringArray.count < subStringArray.count {
//                    savedStringArray = subStringArray
//                }
//                movingIndex += savedStringArray.count-1
//                subStringArray = []
//                break
//            }
//        }
//    }
//    print(savedStringArray)
//    return savedStringArray.count
//}
//
//let count = getLongestSubString()


// jbpnbwwd

//pwwkew




func longestSubString() -> Int {
    
    let mainStr = "abcabcbb"
    var hashMap: [Character: Int] = [:]
    var left = 0
    var longest = 0
    
    for (i, char) in mainStr.enumerated() {
        
        if let previousIndex = hashMap[char], previousIndex >= left {
            left = previousIndex + 1
        }
        
        hashMap[char] = i
        let currentLongest = (i - left) + 1
        printSubString(string: mainStr, start: left, end: i)
        if longest < currentLongest {
            longest = currentLongest
        }
    }
    return longest
}

func printSubString(string: String, start: Int, end: Int) {
    var str = ""
    for i in start ... end {
        str += String(Array(string)[i])
    }
    print(str)
}

let c = longestSubString()
print(c)


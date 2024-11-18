//
//  main.swift
//  All
//
//  Created by chandra sekhar p on 04/09/24.
//

import Foundation

func mergeAlternately(_ word1: String, _ word2: String) -> String {
    var finalString = ""
    let minLength = min(word1.endIndex, word2.endIndex)
    var i = word1.startIndex
    while(i < minLength) {
        finalString.append(word1[i])
        finalString.append(word2[i])
        i = word1.index(after: i)
    }
    if (i < word1.endIndex) {
        finalString.append(contentsOf: word1[i...])
    }
    else {
        finalString.append(contentsOf: word2[i...])
    }
    return finalString
}

func gcdOfStrings(_ str1: String, _ str2: String) -> String {
    
    guard str1 + str2 == str2 + str1 else { return "" }
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        
        let max = max(a, b)
        let min = min(a, b)

        let result = max % min
        if result == 0 { return min }
        return gcd(min, result)
    }
    
    func lcm(_ a: Int, _ b: Int) -> Int {
        return a*b / gcd(a, b)
    }
    
    let gcdLength = gcd(str1.count, str2.count)
    let result = String(str1.prefix(gcdLength))
    return result
}

//print(gcdOfStrings("AAA", "A"))
print(gcdOfStrings("TAUXXTAUXXTAUXXTAUXXTAUXX", "TAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXX"))

class Solution {
    func reverseWords(_ s: String) -> String {
        if s.count == 0 { return s }
        var reversedString = ""
        print(Int32.max)
//        var j = s.index(before: s.endIndex)
//        var isSpace = false
//        var spaces = 0
//        var wordEnd: String.Index = s.endIndex
//        
//        while(j >= s.startIndex) {
//            let char = s[j]
//            if char == Character(" ") {
//                isSpace = true
//                spaces += 1
//            }
//            else {
//                if isSpace {
//                    isSpace = false
//                    let word = s[s.index(j, offsetBy: spaces)..<(wordEnd)]
//                    wordEnd = j
//                    reversedString += word
//                    if j != s.startIndex {
//                        reversedString += " "
//                    }
//                }
//            }
//            j = s.index(before: j)
//        }
//        34 > Int32.max
        return reversedString
    }
}

let Input = "the sky is blue"
print(Solution().reverseWords(Input))


func isAnagram(_ s: String, _ t: String) -> Bool {
    
    if s.count != t.count { return false }
    
    var dict: [Character: Int] = [:]
    
    for val in Array(s) { dict[val, default: 0] += 1 }
    
    for val in Array(t) {
        guard let _val = dict[val] else { return false }
        if _val > 1 { dict[val] = _val - 1 }
        else { dict[val] = nil }
    }
    
    return dict.isEmpty
}

print(isAnagram("ac", "bb"))

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var index = 0
    for val in nums {
        if val != nums[index] {
            index += 1
            nums[index] = val
        }
    }
    return index + 1
}

var input = [0,0,1,1,1,2,2,3,3,4]
removeDuplicates(&input)


func mySqrt(_ x: Int) -> Int {
    for i in 0...x {
        if i * i == x { return i }
        else if i * i > x { return i - 1 }
        else { continue }
    }
    return 0
}

let val = mySqrt(0)
print(val)

func climbStairs(_ n: Int) -> Int {
    if n < 2 { return 1 }
    else { return climbStairs(n - 1) + climbStairs(n - 2) }
}

let val1 = climbStairs(3)
print(val1)


func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
    
    if n == 0 { return true }
    if flowerbed.count == 1 { return flowerbed[0] == 0 }

    var remainingFlowers = n
    var i = 0
    
    while (i < flowerbed.count) {
        if i == 0 {
            if flowerbed[i] == 0 &&  flowerbed[i + 1] == 0 {
                remainingFlowers -= 1
                i += 1
            }
        }
        else if i == flowerbed.count - 1 {
            if flowerbed[i] == 0 &&  flowerbed[i - 1] == 0 {
                remainingFlowers -= 1
                i += 1
            }
        }
        else {
            if flowerbed[i] == 0 &&  flowerbed[i - 1] == 0 && flowerbed[i + 1] == 0 {
                remainingFlowers -= 1
                i += 1
            }
        }
        i += 1
        if remainingFlowers == 0 {
            return true
        }
    }
    return false
}

print(canPlaceFlowers([1,0,0,0,1], 1))



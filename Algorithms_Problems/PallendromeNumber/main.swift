//
//  main.swift
//  PallendromeNumber
//
//  Created by chandra sekhar p on 17/07/24.
//

import Foundation

//func isPalindrome(_ x: Int) -> Bool {
//    if x < 0 { return false }
//    var reverseNumber = 0
//    var num = x
//    while num > 0 {
//        reverseNumber = (reverseNumber * 10) + (num % 10)
//        num = num/10
//    }
//    return reverseNumber == x
//}

func isPalindrome(_ x: Int) -> Bool {
    if x < 0 { return false }
    var y = 0
    var z = x
    while z > 0 {
        y = (y * 10) + (z % 10)
        z = z/10
    }
    return y == x
}

print(isPalindrome(121))


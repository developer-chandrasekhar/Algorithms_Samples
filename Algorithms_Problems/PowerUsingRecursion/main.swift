//
//  main.swift
//  PowerUsingRecursion
//
//  Created by Chandra Sekhar P V on 31/08/23.
//

import Foundation

//Brute force
func powerOf(base: UInt, _ power: UInt) -> UInt {
    if power == 0 { return 1 }
    if base == 1 { return 1 }
    if power == 1 { return base }
    return base * powerOf(base: base, power - 1)
}

//Optimised
func powerOf_1(base: UInt, _ power: UInt) -> UInt {
    if power == 0 { return 1 }
    if base == 1 { return 1 }
    if power == 1 { return base }
    
//    let isOdd = power % 2 != 0
//    let newPower = power / 2
//    var updatedBase = isOdd ? (base * base) : base
//    updatedBase *= base
//    return updatedBase * powerOf(base: base, newPower)
    
//    if power % 2 == 0 {
//        return base * base * powerOf(base: base, power/2)
//    }
//    else {
//        return base * base * base * powerOf(base: base, (power-1)/2)
//    }
    
    if power % 2 == 0 {
        return powerOf(base: base * base, power/2)
    }
    else {
        return base * powerOf(base: base * base, (power-1)/2)
    }
}


let base: UInt = 2
let power: UInt = 5


print("Using Recursion -> \(powerOf(base: base, power))")
print("Using powerOf_1 -> \(powerOf_1(base: base, power))")



//
//  main.swift
//  FactorialOfNumber
//
//  Created by Chandra Sekhar P V on 31/08/23.
//

import Foundation

//Using Recursion
func factorial(n: UInt64) -> UInt64 {
    if n == 0 {
        return 1
    }
    return n * factorial(n: n - 1)
}

//Using Loop
func factorialUsingLoop(n: UInt64) -> UInt64 {
    if n == 0 {return 1}
    var output: UInt64 = 1
    for i in 1...n {
        output = output * i
    }
    return output
}
let number: UInt64 = 0
print("Using Recursion -> \(factorial(n: number))")
print("Using Loop      -> \(factorialUsingLoop(n: number))")




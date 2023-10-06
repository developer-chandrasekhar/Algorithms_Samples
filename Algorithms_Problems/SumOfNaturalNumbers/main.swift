//
//  main.swift
//  SumOfNaturalNumbers
//
//  Created by Chandra Sekhar P V on 31/08/23.
//

import Foundation


func sumOfNaturalNumbers(n: Int) -> Int {
    
    // Using formila n(n+1)/2
//    return n*(n+1)/2
    
    // Using while loop
//    var counter = 1
//    var output = 0
//    while (counter <= n) {
//        output += counter
//        counter += 1
//    }
//    return output
    
    // Using for loop
//    var outPut = 0
//    for i in 1...n {
//        outPut += i
//    }
//    return outPut
    
//     Using recursion
    if n == 0 { return 0 }
    return n + sumOfNaturalNumbers(n: n-1)
    
    
     
}

print(sumOfNaturalNumbers(n: 4))

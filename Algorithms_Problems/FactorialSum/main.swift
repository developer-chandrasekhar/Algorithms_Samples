//
//  main.swift
//  FactorialSum
//
//  Created by chandra sekhar p on 15/08/24.
//

import Foundation

print("Hello, World!")

func addDigits(_ num: Int) -> Int {
       if num < 10 { return num }
       var sum = 0
       var temp = num
       while temp > 0 {
           sum += temp%10
           temp = temp/10
       }
       return addDigits(sum)
   }

print(addDigits(38))


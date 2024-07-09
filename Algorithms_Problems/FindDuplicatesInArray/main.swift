//
//  main.swift
//  FindDuplicatesInArray
//
//  Created by Chandra Sekhar P V on 05/10/23.
//

import Foundation

func findDuplicates(input: [Int]) {
    var duplicateDict: [Int: Int] = [:]
    
    for i in 0 ..< input.count {
        var numberOfTimes = 1
        if let _value = duplicateDict[input[i]] {
            numberOfTimes = _value + 1
        }
       duplicateDict[input[i]] = numberOfTimes
    }
    
    for i in duplicateDict {
        if i.value > 1 {
            print("\(i.key) -> \(i.value)")
        }
    }
}

let data = [1, 2, 3, 2, 4, 5, 5, 6, 6, 6, 6]
print(findDuplicates(input: data))

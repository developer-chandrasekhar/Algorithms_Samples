//
//  main.swift
//  CountDistinctElementsInEveryWindowOfSizeK
//
//  Created by chandra sekhar p on 08/07/24.
//

import Foundation

func countElements(input: [Int] = [1, 2, 1, 3, 4, 4, 3], subArraySize: Int) -> [Int] {
  
    var left = 0
    var windowSize = 0
    var output: [Int] = []
    var hashMap: [Int: Int] = [:]
    
    for item in input {
        windowSize += 1
        if var count = hashMap[item] {
            count += 1
            hashMap[item] = count
        }
        else {
            hashMap[item] = 1
        }
        if windowSize == subArraySize {
            output.append(hashMap.keys.count)
            windowSize -= 1
            let leftValue = input[left]
            if let count = hashMap[leftValue] {
                if count == 1 {
                    hashMap[leftValue] = nil
                }
                else {
                    hashMap[leftValue] = count - 1
                }
            }
            left += 1
        }
    }
    
    
    
    
    
    return output
}

print(countElements(subArraySize: 3))

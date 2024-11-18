//
//  main.swift
//  MaxSumSubarrayOfSizeK
//
//  Created by chandra sekhar p on 08/07/24.
//

import Foundation

func maxSumSubarrayOfSize(input: [Int], subArraySize: Int) -> Int {
    if input.count == 0 { return 0 }
    var maxSum = input.first ?? 0
    var windowSize = 0
    var currentSum = 0
    var left = 0
    
    for (_, value) in input.enumerated() {
        currentSum += value
        windowSize += 1
        if windowSize == subArraySize {
            maxSum = max(currentSum, maxSum)
            windowSize -= 1
            currentSum -= input[left]
            left += 1
        }
    }
    
    return maxSum
}

print(maxSumSubarrayOfSize(input: [100, 200, 700, 500, 400, 100], subArraySize: 3))



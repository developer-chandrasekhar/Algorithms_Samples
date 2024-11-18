//
//  main.swift
//  MedianOfTwoSortedArrays
//
//  Created by chandra sekhar p on 14/07/24.
//

//Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
//
//The overall run time complexity should be O(log (m+n)).
//
// 
//
//Example 1:
//
//Input: nums1 = [1,3], nums2 = [2]
//Output: 2.00000
//Explanation: merged array = [1,2,3] and median is 2.
//Example 2:
//
//Input: nums1 = [1,2], nums2 = [3,4]
//Output: 2.50000
//Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

import Foundation

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    
    let count: Double = Double(nums1.count + nums2.count)
    let centerPoint = Int(floor(count/2))
    
    var counter = 0
    
    var finalArray: [Int] = []
    
    var i = 0
    var j = 0
    
    var val1 = 0
    var val2 = 0
    
    let assign: (Int) -> Void = { num in
        finalArray.append(num)
        val1 = val2
        val2 = num
        counter += 1
    }
    
    
    while (counter <= centerPoint) {
        
        if nums1.count > i && nums2.count > j {
            if nums1[i] < nums2[j] {
                assign(nums1[i])
                i += 1
            }
            else {
                assign(nums2[j])
                j += 1
            }
        }
        else if nums1.count > i {
            assign(nums1[i])
            i += 1
        }
        else if nums2.count > j {
            assign(nums2[j])
            j += 1
        }
    }
    print(finalArray)
    var result: Double =  Double(val2)
    
    if (count.truncatingRemainder(dividingBy: 2.0) == 0.00) {
        result = Double((val1 + val2)) / Double(2)
    }
    return result
}


print(findMedianSortedArrays([1,2,4], [2]))


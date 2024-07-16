//
//  main.swift
//  Sorting
//
//  Created by chandra sekhar p on 15/07/24.
//

import Foundation


//func sort(nums: [Int]) -> [Int] {
//    
//    var sortedPosition = 0
//    var finalArray: [Int] = nums
//    var counter = 1
//    
//    while sortedPosition < finalArray.count {
//        for (index) in sortedPosition ..< finalArray.count {
//            counter += 1
//            if finalArray[index] < finalArray[sortedPosition] {
//                finalArray.swapAt(index, sortedPosition)
//            }
//        }
//        sortedPosition += 1
//    }
//    print(counter)
//    return finalArray
//}
// let nums = [38, 27, 43, 3, 9, 82, 10]
//print(sort(nums: nums))

func splitArray<T>(array: [T]) -> ([T], [T]) {
    let half = array.count / 2 + array.count % 2
    let head = array[0..<half]
    let tail = array[half..<array.count]
    return (Array(head), Array(tail))
}


func mergeSort(nums: [Int]) -> [Int] {
    
    guard nums.count > 1 else { return nums }
    let splits = splitArray(array: nums)
    let left = mergeSort(nums: splits.0)
    let right = mergeSort(nums: splits.1)
    return mergeSortedArrays(first: left, second: right)
}

func mergeSortedArrays(first: [Int], second: [Int]) -> [Int] {
    
    var finalArray: [Int] = []
    var i = 0
    var j = 0
    
    while finalArray.count < (first.count + second.count) {
        if first.count > i && second.count > j {
            if first[i] < second[j] {
                finalArray.append(first[i])
                i += 1
            }
            else {
                finalArray.append(second[j])
                j += 1
            }
        }
        else if first.count > i {
            finalArray.append(first[i])
            i += 1
        }
        else {
            finalArray.append(second[j])
            j += 1
        }
    }
    return finalArray
}

let nums = [38, 27, 43, 3, 9, 82, 10]
print(mergeSort(nums: nums))


//func mergeSort(nums: [Int], finalResult: inout [Int]) {
//        
//    var splitResult: [Int] = []
//
//    let mergeSortedArrays: (_ first: [Int], _ second: [Int]) -> [Int] = { (first, second) in
//        
//        var finalArray: [Int] = []
//        var i = 0
//        var j = 0
//        
//        
//        while finalArray.count < (first.count + second.count) {
//            if first.count > i && second.count > j {
//                if first[i] < second[j] {
//                    finalArray.append(first[i])
//                    i += 1
//                }
//                else {
//                    finalArray.append(second[j])
//                    j += 1
//                }
//            }
//            else if first.count > i {
//                finalArray.append(first[i])
//                i += 1
//            }
//            else {
//                finalArray.append(second[j])
//                j += 1
//            }
//        }
//        return finalArray
//    }
//    if nums.count == 1 {
//        if finalResult.count == 0 {
//            finalResult.append(nums[0])
//        } else {
//            finalResult = mergeSortedArrays(nums, finalResult)
//        }
//    }
//    else {
//        let splits: (first: [Int], second: [Int]) = splitArray(array: nums)
//        mergeSort(nums: splits.first, finalResult: &splitResult)
//        finalResult = mergeSortedArrays(splitResult, finalResult)
//        splitResult = []
//        mergeSort(nums: splits.second, finalResult: &splitResult)
//        finalResult = mergeSortedArrays(splitResult, finalResult)
//        splitResult = []
//    }
//}
//
//
//
//
//let nums = [38, 27, 43, 3, 9, 82, 10]
//var finalArray: [Int] = []
//mergeSort(nums: nums, finalResult: &finalArray)
//print(finalArray)





//func mergeSortWithSelectionSort(nums: [Int]) -> [Int] {
//    
//    var left = 0
//    var finalArray: [Int] = [nums[0]]
//    
//    while (left < nums.count - 1) {
//        let temp = merge(array: finalArray, value: nums[left+1])
//        finalArray = temp
//        left += 1
//    }
//    return finalArray
//}
//
//func merge(array: [Int], value: Int) -> [Int] {
//    var finalArray: [Int] = []
//    var isInserted = false
//    for val in array {
//        
//        if val < value || isInserted {
//            finalArray.append(val)
//        }
//        else {
//            isInserted = true
//            finalArray.append(value)
//            finalArray.append(val)
//        }
//    }
//    if !isInserted { finalArray.append(value) }
//    return finalArray
//}
//
// let nums = [38, 27, 43, 3, 9, 82, 10]
//print(mergeSortWithSelectionSort(nums: nums))
    






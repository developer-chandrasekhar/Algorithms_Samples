//
//  main.swift
//  BinorySearch
//
//  Created by Chandra Sekhar P V on 26/09/23.
//

import Foundation

func REC_findElement(element: Int, start: Int, end: Int, array:[Int]) -> Int? {
    if start > end {
        return nil
    }
    
    let mid: Int = calculateMid(s: start, e: end)
    let midValue = array[mid]
    
    if midValue == element {
        return mid
    } else if(midValue > element) {
        return REC_findElement(element: element, start: start, end: mid-1, array: array)
    } else {
        return REC_findElement(element: element, start: mid+1, end: end, array: array)
    }
}

func findElement(element: Int, array: [Int]) -> Int? {
    
    if array.count == 0 { return nil }
    
    var start = 0
    var end = array.count-1
    
    while(start <= end) {
        let mid: Int = calculateMid(s: start, e: end)
        let midValue = array[mid]
        
        if midValue == element {
            return mid
        } else if(midValue > element) {
            end = mid-1
        } else {
            start = mid+1
        }
    }
    return nil
}

func calculateMid(s: Int, e: Int) -> Int {
    return Int(ceil(Double((s+e)/2)))
}

let array = [1, 3, 5, 7, 10, 14, 24, 35, 56]
let finder = 50
let find = findElement(element: finder, array: array)

let rec_find = REC_findElement(element: finder, start: 0, end: array.count - 1, array: array)
print(find ?? "NO INDEX FOUND")
print(rec_find ?? "NO INDEX FOUND")


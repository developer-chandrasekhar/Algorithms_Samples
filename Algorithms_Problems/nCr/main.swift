//
//  main.swift
//  nCr
//
//  Created by Chandra Sekhar P V on 05/09/23.
//

import Foundation

func combinations<T>(_ arr: [T], _ r: Int, _ prefix: [T] = [], _ index: Int = 0) {
    if r == 0 {
        print(prefix)
        return
    }
    
    for i in index..<arr.count {
        var updatedPrefix = prefix
        updatedPrefix.append(arr[i])
        combinations(arr, r - 1, updatedPrefix, i + 1)
    }
}

// Example usage
let elements = [1, 2, 3, 4, 5]
let r = 3
combinations(elements, r)


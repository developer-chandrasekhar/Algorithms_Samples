//
//  main.swift
//  FindPairsOfGivenSum
//
//  Created by Chandra Sekhar P V on 06/10/23.
//

import Foundation

func printPairs(input: [Int], sum: Int) {
    let data = input
    let sum = sum
    
    var hashSet: [Int: Int] = [:]
    
    for value in data {
       let pairingValue = sum - value
        if let _pairingValue = hashSet[pairingValue] {
            print("\(_pairingValue) + \(value)")
        }
        hashSet[value] = value
    }
}

func printPairsWithSortedData(input: [Int], sum: Int) {
    
    var i = 0
    var j = input.count - 1
    
    while (i < j) {
        
        let iValue = input[i]
        let jValue = input[j]
        let _sum = (iValue + jValue)
        
        if _sum == sum {
            print("\(iValue) + \(jValue) = \(sum)")
            i += 1
            j -= 1
        }
        else if (_sum > sum){
            j -= 1
        } else {
            i += 1
        }
    }
}

let data = [1, 2, 3, 4, 5, 6, 9, 10, 11, 12]
//printPairs(input: data, sum: 9)
printPairsWithSortedData(input: data, sum: 12)


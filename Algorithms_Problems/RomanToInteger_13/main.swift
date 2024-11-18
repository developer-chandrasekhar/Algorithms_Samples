//
//  main.swift
//  RomanToInteger_13
//
//  Created by chandra sekhar p on 16/08/24.
//

import Foundation

func romanToInt(_ s: String) -> Int {
    let symbols: [Character: Int] = [ "I": 1,
                    "V": 5,
                    "X": 10,
                    "L": 50,
                    "C": 100,
                    "D": 500,
                    "M": 1000 ]
    var sum = 0
    var inputArray: [Character] = Array(s)
    var i = 0
    while i < inputArray.count {
        let symbol = inputArray[i]
        let romanValue = symbols[symbol] ?? 0
        if i == inputArray.count - 1 {
            sum += romanValue
            break
        }
        let nextRomanValue = symbols[inputArray[i+1]] ?? 0
        if romanValue < nextRomanValue {
            let actualValue = nextRomanValue - romanValue
            sum += actualValue
            i += 1
            if i == inputArray.count - 1 {
                break
            }
        }
        else {
            sum += romanValue
        }
        i += 1
    }
    return sum
}

//let input = "MCMXCIV"
let input = "MDCXCV"

romanToInt(input)

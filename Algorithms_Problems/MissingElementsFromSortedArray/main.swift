//
//  main.swift
//  MissingElementsFromSortedArray
//
//  Created by Chandra Sekhar P V on 05/10/23.
//

import Foundation

func missingElements(input: [Int]) -> [Int] {
    
//    if (input.count <= 1) { return [] }
    
    var missingElements: [Int] = []
    var difference = input[0]
    var index = 0
    
    while (index != input.count) {
        if (input[index] - index) != difference {
            missingElements.append(index + difference)
            difference += 1
        }
        else {
            index += 1
        }
    }
    return missingElements
}

let data =  [11, 12, 14, 27, 29]
print(missingElements(input: data))


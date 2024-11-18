//
//  main.swift
//  SpiralMatrix
//
//  Created by chandra sekhar p on 25/07/24.
//

import Foundation

/*
 Given an m x n matrix, return all elements of the matrix in spiral order.

  

 Example 1:


 Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [1,2,3,6,9,8,7,4,5]
 Example 2:


 Input: matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 Output: [1,2,3,4,8,12,11,10,9,5,6,7]
  

 Constraints:

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 10
 -100 <= matrix[i][j] <= 100
 */

// with pointers
//
//class Solution {
//    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
//                
//        var finalArray: [Int] = []
//        
//        var top = 0, left = 0
//        var bottom = matrix.count-1
//        var right = matrix[0].count-1
//
//        
//        while(top <= bottom && left <= right) {
//            // top
//            for col in left...right {
//                finalArray.append(matrix[top][col])
//            }
//            top += 1
//           
//            // right
//            for row in top...bottom {
//                finalArray.append(matrix[row][right])
//            }
//            right -= 1
//
//            //bottom
//            if top <= bottom && left < right {
//                for col in (left...right).reversed() {
//                    finalArray.append(matrix[bottom][col])
//                }
//            }
//            bottom -= 1
//
//            //left
//            if top <= bottom  {
//                for row in (top...bottom).reversed() {
//                    finalArray.append(matrix[row][left])
//                }
//            }
//            left += 1
//
//        }
//        return finalArray
//     }
// }


// with deletion
public class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        
        var processedArray = matrix
        
        var finalArray: [Int] = []

        
        while(processedArray.count != 0) {
            // First Row
            finalArray.append(contentsOf: processedArray[0])
            processedArray.remove(at: 0)
           
            // Row last
            for (i, val) in processedArray.enumerated() {
                if let last = val.last {
                    finalArray.append(last)
                    processedArray[i].remove(at: val.count - 1)
                }
            }
            // last row
            if let lastRow = processedArray.last {
                for i in 0..<lastRow.count {
                    let val = lastRow[(lastRow.count-1) - i]
                    finalArray.append(val)
                }
                processedArray.removeLast()
            }
            if processedArray.count > 0 {
                for i in 0..<processedArray.count {
                    var val = processedArray[(processedArray.count-1) - i]
                    if val.count > 0 {
                        finalArray.append(val[0])
                        processedArray[(processedArray.count-1) - i].remove(at: 0)
                    }
                }
            }
        }
        return finalArray
     }
 }

//let data = [[7],[9],[6]]
//let data = [[2,5],[8,4],[0,-1]]
let data = [[1,2,3,4], [5,6, 7, 8], [9, 10, 11, 12]]
print(Solution().spiralOrder(data))




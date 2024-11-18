//
//  main.swift
//  ZigzagConversion
//
//  Created by chandra sekhar p on 25/07/24.
//

/*
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"

 Write the code that will take a string and make this conversion given a number of rows:

 string convert(string s, int numRows);
  

 Example 1:

 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"
 Example 2:

 Input: s = "PAYPALISHIRING", numRows = 4
 Output: "PINALSIGYAHRPI"
 Explanation:
 P     I    N
 A   L S  I G
 Y A   H R
 P     I
 Example 3:

 Input: s = "A", numRows = 1
 Output: "A"
  

 Constraints:

 1 <= s.length <= 1000
 s consists of English letters (lower-case and upper-case), ',' and '.'.
 1 <= numRows <= 1000
 */

import Foundation

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 { return s }

        let stringArray = Array(s)
        var rows = Array(repeating: "", count: min(numRows, s.count))
        var currentRow = 0
        var goingDown = false

        for char in stringArray {
            rows[currentRow] += String(char)
            if currentRow == 0 || currentRow == numRows - 1 {
                goingDown.toggle()
            }
            currentRow += goingDown ? 1 : -1
        }

        return rows.joined()
    }
}

let s = "PAYPALISHIRING"
var numRows = 4

print(Solution().convert(s, numRows))


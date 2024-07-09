//
//  main.swift
//  MaxProfit
//
//  Created by Chandra Sekhar P V on 24/11/23.
//

import Foundation

//func maxProfit(_ prices: [Int]) -> Int {
//    
//    var buyDay: Int = 0
//    var sellDay: Int = 0
//    
//    var tempBuyDay: Int = 0
//    var tempSellDay: Int = 0
//    
//    var tempBuyValue: Int = prices[0]
//    var tempSellValue: Int = 0
//    
//    var profit: Int = 0
//    
//    for i in 1..<prices.count {
//        
//        let currentValue = prices[i]
//        
//        if (currentValue < tempBuyValue) {
//            tempBuyValue = currentValue
//            tempBuyDay = i
//            tempSellValue = currentValue
//        } else if (currentValue > tempSellValue) {
//            tempSellValue = currentValue
//            tempSellDay = i
//        }
//        
//        if (tempBuyDay <= tempSellDay && profit <= (tempSellValue - tempBuyValue)) {
//            profit = (tempSellValue - tempBuyValue)
//            buyDay = tempBuyDay
//            sellDay = tempSellDay
//        }
//    }
//    print(buyDay)
//    print(sellDay)
//    
//    return profit
//}

//let output = maxProfit([8, 2, 5, 3, 7, 4, 1, 6])
//print("output: \(output)")


func cumulativeMaxProfit(_ prices: [Int]) -> Int {
    
    var profit = 0
    
    var buyValue = prices[0]
    var sellValue = prices[0]
    
    for i in 1 ..< prices.count {
        let currentValue = prices[i]
        
        if sellValue > currentValue {
            profit += sellValue - buyValue
            buyValue = currentValue
            sellValue = currentValue
        }
        
        else {
            sellValue = currentValue
            if i == prices.count - 1 {
                profit += sellValue - buyValue
            }
        }
    }
    
    return profit
}

let output = cumulativeMaxProfit([7, 1, 5, 3, 6, 4, 7])
print(output)


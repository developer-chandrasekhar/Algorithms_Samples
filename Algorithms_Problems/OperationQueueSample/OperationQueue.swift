//
//  OperationQueue.swift
//  OperationQueueSample
//
//  Created by chandra sekhar p on 13/07/24.
//

import Foundation

class OperationQueueTest {
    
    let operationQueue = OperationQueue()

    let operation1 = BlockOperation {
        DispatchQueue.main.async {
            print("Operation 1")
        }
    }
    
    let operation2 = BlockOperation {
        DispatchQueue.main.async {
            print("Operation 2")
        }    }
    
    let operation3 = BlockOperation {
        DispatchQueue.main.async {
            print("Operation 3")
        }    }
    
    init () {
        operationQueue.addOperations([operation1, operation2, operation3], waitUntilFinished: true)
    }
    
    func execute() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            print("Hello")
        }
    }
}


class Animal {
    class func sound() {
        print("Some generic animal sound")
    }
}

class Dog: Animal {
    
    override class func sound() {
        print("Some generic animal sound")
    }
}

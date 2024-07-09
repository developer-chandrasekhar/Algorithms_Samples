//
//  main.swift
//  StringOperations
//
//  Created by Chandra Sekhar P V on 10/10/23.
//

import Foundation

func numberOfWords(fromSentence string: String) -> Int {
    
    let stringArray: [Character] = Array(sentence)
    var numberOfWords: Int = 0
    var wordsArray: [String] = []
    var tempWord = ""
    
    for (index, value) in stringArray.enumerated() {
        if numberOfWords == 0 && value != " " {
            numberOfWords += 1
        }
        else if value != " " && stringArray[index - 1] == " " {
            numberOfWords += 1
            wordsArray.append(tempWord)
            tempWord = ""
        }
        if(value != " ") {
            tempWord.append(value)
        }
    }
    
    if tempWord.count > 0 {
        wordsArray.append(tempWord)
    }
    print(wordsArray)
    reverse()
    print(wordsArray)
    
    func reverse() {
        var startIndex = 0
        var endIndex = wordsArray.count - 1
        while (startIndex < endIndex) {
            var temp = wordsArray[startIndex]
            wordsArray[startIndex] = wordsArray[endIndex]
            wordsArray[endIndex] = temp
            startIndex += 1
            endIndex -= 1
        }
    }
    
    return numberOfWords
}

let sentence = " this is string     sentence  "
print(numberOfWords(fromSentence: sentence))


func uppercased(input: String, isLower: Bool = false) -> String {
    
    var charArray: [Character] = Array(input)
    let upperCaseA: Character = "A"
    let lowerCaseA: Character = "a"
    let upperCaseZ: Character = "Z"
    let lowerCaseZ: Character = "z"
    
    let upperCaseAAscii =  upperCaseA.asciiValue
    let upperCaseZAscii =  upperCaseZ.asciiValue
    let lowerCaseAAscii = lowerCaseA.asciiValue
    let lowerCaseZAscii =  lowerCaseZ.asciiValue
    
    let asciiDif = (lowerCaseA.asciiValue ?? 0) - (upperCaseA.asciiValue ?? 0)
    
    for (index, value) in charArray.enumerated() {
        guard let ascii = value.asciiValue else { continue }
        
        if isLower {
            if let upperCaseAAscii, let upperCaseZAscii {
                if upperCaseAAscii <= ascii && ascii <= upperCaseZAscii {
                    let upperChar = UnicodeScalar(ascii + asciiDif)
                    charArray[index] = Character(upperChar)
                }
            }
        }
        else {
            if let lowerCaseAAscii, let lowerCaseZAscii {
                if ascii >= lowerCaseAAscii && ascii <= lowerCaseZAscii {
                    let upperChar = UnicodeScalar(ascii - asciiDif)
                    charArray[index] = Character(upperChar)
                }
            }
        }
    }
    return String(charArray)
}

print("------------------------------------------------")
print("Case checking")
let string = "ChanDra 123"
print("Input: \(string)")
print(uppercased(input: string, isLower: true))
print("------------------------------------------------")

func isPalindrome(string: String) -> Bool {
    let charArray: [Character] = Array(string)
    var startIndex = 0
    var endIndex = charArray.count - 1
    while(startIndex < endIndex) {
        if charArray[startIndex] != charArray[endIndex] {
            return false
        }
        startIndex += 1
        endIndex -= 1
    }
    return true
}

let palindromeString = "madam"
print("------------------------------------------------")
print("Palindrome")
print("Input: \(palindromeString)")
print("Output: \(isPalindrome(string: palindromeString))")
print("------------------------------------------------")


//
//  main.swift
//  TowersOfHanoi
//
//  Created by Chandra Sekhar P V on 15/09/23.
//

import Foundation

func TOHonnai<T>(diskCount: Int, source: T, auxiliary: T, destination: T) {
    if diskCount == 0 {
        return
    }
    TOHonnai(diskCount: diskCount - 1, source: source, auxiliary: destination, destination: auxiliary)
    print(" move \(source) -> \(destination)")
    TOHonnai(diskCount: diskCount - 1, source: auxiliary, auxiliary: source, destination: destination)
}

TOHonnai(diskCount: 3, source: "A", auxiliary: "B", destination: "C")


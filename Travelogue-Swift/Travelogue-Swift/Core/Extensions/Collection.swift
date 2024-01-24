//
//  Collection.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 24.01.2024.
//

import Foundation

// An extension on the Collection protocol to enhance safety when accessing elements at a specific index.
extension Collection {
    
    // A custom subscript 'safe' that allows for secure element retrieval by checking index validity.
    // If the index is within the collection's bounds, it returns the corresponding element; otherwise, it returns nil.
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


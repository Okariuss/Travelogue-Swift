//
//  FontConstants.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 17.02.2024.
//

import Foundation

enum FontConstants {
    case aldrich
    case bilbo
    
    var rawValue: String {
        switch self {
        case .aldrich:
            return "Aldrich-Regular"
        case .bilbo:
            return "BilboSwashCaps-Regular"
        }
    }
}

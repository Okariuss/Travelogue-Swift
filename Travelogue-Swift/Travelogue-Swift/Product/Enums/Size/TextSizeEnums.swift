//
//  TextSizeEnums.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 12.01.2024.
//

import Foundation


enum TextSizeEnums {
    case small
    case normal
    case large
    case extraLarge
    
    var rawValue: CGFloat {
        switch self {
        case .small:
            return 8
        case .normal:
            return 16
        case .large:
            return 32
        case .extraLarge:
            return 64
        }
    }
}

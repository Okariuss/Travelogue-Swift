//
//  SpaceEnums.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 13.01.2024.
//

import Foundation

enum SpaceEnums {
    case small
    case normal
    case large
    case extraLarge
    
    var rawValue: CGFloat {
        switch self {
        case .small:
            return 10
        case .normal:
            return 20
        case .large:
            return 30
        case .extraLarge:
            return 40
        }
    }
}

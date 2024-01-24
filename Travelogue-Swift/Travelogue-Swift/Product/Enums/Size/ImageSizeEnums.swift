//
//  ImageSize.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 12.01.2024.
//

import Foundation

enum ImageSizeEnums {
    case normal
    case medium
    case high

    var rawValue: Int {
        switch self {
        case .normal:
            return 128
        case .medium:
            return 256
        case .high:
            return 512
        }
        
    }
    
    var toSize: CGSize {
        return CGSize(width: rawValue, height: rawValue)
    }
    
}

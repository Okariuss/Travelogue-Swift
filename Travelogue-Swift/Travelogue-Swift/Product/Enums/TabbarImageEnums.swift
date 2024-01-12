//
//  ImageEnums.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 12.01.2024.
//

import Foundation
import UIKit


enum TabbarImageEnums {
    case house
    case favorite

    var rawValue: String {
        switch self {
        case .house:
            return "house"
        case .favorite:
            return "heart"
        }
        
    }
    
    var toSelected: UIImage? {
        return UIImage(systemName: "\(rawValue).fill")
    }
    
    var toUnselected: UIImage? {
        return UIImage(systemName: rawValue)
    }
    
}

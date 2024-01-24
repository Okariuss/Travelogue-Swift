//
//  ImageEnums.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 12.01.2024.
//

import Foundation
import UIKit


enum SystemImageEnums {
    case house
    case favorite
    case forward

    var rawValue: String {
        switch self {
        case .house:
            return "house"
        case .favorite:
            return "heart"
        case .forward:
            return "chevron.forward"
        }
        
    }
    
    var toSelected: UIImage? {
        return UIImage(systemName: "\(rawValue).fill")
    }
    
    var normal: UIImage? {
        return UIImage(systemName: rawValue)
    }
    
}

//
//  ImageEnums.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 12.01.2024.
//

import Foundation
import UIKit


enum ImageEnums {
    case icon
    case hotel
    case needHelp
    case travel
    

    var rawValue: String {
        switch self {
        case .icon:
            return "Icon"
        case .hotel:
            return "Hotel"
        case .needHelp:
            return "Need_Help"
        case .travel:
            return "Travel"
        }
        
    }
    
    
    var toImage: UIImage? {
        return UIImage(named: rawValue)
    }
}

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
    

    var rawValue: String {
        switch self {
        case .icon:
            return "Icon"
        }
        
    }
    
    
    var toImage: UIImage? {
        return UIImage(named: rawValue)
    }
}

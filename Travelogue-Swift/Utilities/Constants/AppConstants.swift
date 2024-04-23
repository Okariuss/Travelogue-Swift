//
//  AppConstants.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 22.04.2024.
//

import Foundation
import UIKit

final class AppConstants {
    
    enum FontName {
        static let title = "BilboSwashCaps-Regular"
    }
    
    enum AnimationName {
        case plane
        case travelBus
        
        var rawValue: String {
            switch self {
            case .plane:
                "plane"
            case .travelBus:
                "travel_bus"
            }
        }
    }
    
    enum SystemImages {
        case house
        
        var rawValue: String {
            switch self {
            case .house:
                return "house"
            }
            
        }
        
        var toSelected: UIImage {
            return UIImage(systemName: "\(rawValue).fill")!
        }
        
        var normal: UIImage {
            return (UIImage(systemName: rawValue)?.withRenderingMode(.alwaysOriginal).withTintColor(.white))!
        }
    }
    
    enum Images {
        case appImage
        case background
        
        var rawValue: String {
            switch self {
            case .appImage:
                "app_image"
            case .background:
                "background"
            }
        }
        
        var toImage: UIImage {
            return UIImage(named: "img_\(rawValue)")!
        }
    }
    
    enum FontSize {
        // Title font sizes
        static let extraLargeTitle: CGFloat = 48
        static let largeTitle: CGFloat = 28
        static let title: CGFloat = 22
        static let mediumTitle: CGFloat = 20
        
        // Body font sizes
        static let body: CGFloat = 17
        static let caption: CGFloat = 15
        
        // Small font sizes
        static let small: CGFloat = 13
        static let extraSmall: CGFloat = 11
    }
    
    enum Spacing {
        static let small: CGFloat = 8
        static let medium: CGFloat = 16
        static let large: CGFloat = 24
        static let extraLarge: CGFloat = 32
    }
    
    enum ImageSize {
        static let small: CGFloat = 24
        static let medium: CGFloat = 48
        static let large: CGFloat = 96
        static let extraLarge: CGFloat = 128
        static let xxLarge: CGFloat = 256
    }
}

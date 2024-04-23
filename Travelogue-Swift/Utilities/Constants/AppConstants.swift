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
        case bilboSwash
        
        var rawValue: String {
            switch self {
            case .bilboSwash:
                "BilboSwashCaps-Regular"
            }
        }
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
        case next
        case back
        
        var rawValue: String {
            switch self {
            case .house:
                return "house"
            case .next:
                return "chevron.right"
            case .back:
                return "chevron.left"
            }
            
        }
        
        var toSelected: UIImage {
            return UIImage(systemName: "\(rawValue).fill")!
        }
        
        var normal: UIImage {
            return (UIImage(systemName: rawValue))!
        }
    }
    
    enum Images {
        case appImage
        case background
        case onboard1
        case onboard2
        case onboard3
        
        var rawValue: String {
            switch self {
            case .appImage:
                "app_image"
            case .background:
                "background"
            case .onboard1:
                "onboard1"
            case .onboard2:
                "onboard2"
            case .onboard3:
                "onboard3"
            }
        }
        
        var toImage: UIImage {
            return UIImage(named: "img_\(rawValue)")!
        }
    }
    
    enum FontSize {
        // Title font sizes
        case extraLargeTitle
        case largeTitle
        case title
        case mediumTitle
        
        // Body font sizes
        case body
        case caption
        
        // Small font sizes
        case small
        case extraSmall
        
        var rawValue: CGFloat {
            switch self {
            case .extraLargeTitle:
                return 48
            case .largeTitle:
                return 28
            case .title:
                return 22
            case .mediumTitle:
                return 20
            case .body:
                return 17
            case .caption:
                return 15
            case .small:
                return 13
            case .extraSmall:
                return 11
            }
        }
        
        var toFont: UIFont {
            return .systemFont(ofSize: rawValue)
        }
    }
    
    enum Spacing {
        case small
        case medium
        case large
        case extraLarge
        
        var rawValue: CGFloat {
            switch self {
            case .small:
                return 8
            case .medium:
                return 16
            case .large:
                return 24
            case .extraLarge:
                return 32
            }
        }
    }
    
    enum ImageSize {
        case small
        case medium
        case large
        case extraLarge
        case xxLarge
        
        var rawValue: CGFloat {
            switch self {
            case .small:
                return 24
            case .medium:
                return 48
            case .large:
                return 96
            case .extraLarge:
                return 128
            case .xxLarge:
                return 256
            }
        }
    }
    
    enum UserDefaultsEnums {
        case isFirst
        
        var rawValue: String {
            switch self {
            case .isFirst:
                "isFirst"
            }
        }
    }
}

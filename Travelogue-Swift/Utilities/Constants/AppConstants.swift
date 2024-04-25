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
        case alfaSlab
        case bilboSwash
        
        var rawValue: String {
            switch self {
            case .alfaSlab:
                "AlfaSlabOne-Regular"
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
        case mail
        case key
        case showPassword
        case hidePassword
        
        var rawValue: String {
            switch self {
            case .house:
                "house"
            case .next:
                "chevron.right"
            case .back:
                "chevron.left"
            case .mail:
                "envelope"
            case .key:
                "key.horizontal"
            case .showPassword:
                "eye"
            case .hidePassword:
                "eye.slash"
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
                48
            case .largeTitle:
                28
            case .title:
                22
            case .mediumTitle:
                20
            case .body:
                17
            case .caption:
                15
            case .small:
                13
            case .extraSmall:
                11
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
                8
            case .medium:
                16
            case .large:
                24
            case .extraLarge:
                32
            }
        }
    }
    
    enum ImageSize {
        case small
        case medium
        case large
        case extraLarge
        case big
        case xxLarge
        
        var rawValue: CGFloat {
            switch self {
            case .small:
                24
            case .medium:
                48
            case .large:
                96
            case .extraLarge:
                128
            case .big:
                192
            case .xxLarge:
                256
            }
        }
    }
    
    enum UserDefaultsEnums {
        case isFirst
        case isLogin
        
        var rawValue: String {
            switch self {
            case .isFirst:
                "isFirst"
            case .isLogin:
                "isLogin"
            }
        }
    }
    
    enum TextFieldHeight {
        case small
        case medium
        case large
        
        var rawValue: CGFloat {
            switch self {
            case .small:
                40
            case .medium:
                60
            case .large:
                80
            }
        }
    }
}

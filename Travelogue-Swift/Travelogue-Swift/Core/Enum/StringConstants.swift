//
//  StringConstants.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 12.01.2024.
//

import Foundation

enum StringEnums {
    case appName
    
    case splashText
    case onboardSkip
    case onboardFirstHeader
    case onboardFirstSubtitle
    case onboardSecondHeader
    case onboardSecondSubtitle
    case onboardThirdHeader
    case onboardThirdSubtitle
    
    var rawValue: String {
        switch self {
        case .appName:
            return "appName"
        case .splashText:
            return "splashText"
        case .onboardSkip:
            return "onboardSkip"
        case .onboardFirstHeader:
            return "onboardFirstHeader"
        case .onboardFirstSubtitle:
            return "onboardFirstSubtitle"
        case .onboardSecondHeader:
            return "onboardSecondHeader"
        case .onboardSecondSubtitle:
            return "onboardSecondSubtitle"
        case .onboardThirdHeader:
            return "onboardThirdHeader"
        case .onboardThirdSubtitle:
            return "onboardThirdSubtitle"
        }
    }
    
    var toLocalized: String {
        return rawValue.localized()
    }
}

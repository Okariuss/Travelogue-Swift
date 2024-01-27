//
//  StringConstants.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 12.01.2024.
//

import Foundation

enum StringEnums {
    case appName
    case aldrich
    case bilbo
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
            return "appName".localized()
        case .aldrich:
            return "Aldrich-Regular"
        case .bilbo:
            return "BilboSwashCaps-Regular"
        case .splashText:
            return "splashText".localized()
        case .onboardSkip:
            return "onboardSkip".localized()
        case .onboardFirstHeader:
            return "onboardFirstHeader".localized()
        case .onboardFirstSubtitle:
            return "onboardFirstSubtitle".localized()
        case .onboardSecondHeader:
            return "onboardSecondHeader".localized()
        case .onboardSecondSubtitle:
            return "onboardSecondSubtitle".localized()
        case .onboardThirdHeader:
            return "onboardThirdHeader".localized()
        case .onboardThirdSubtitle:
            return "onboardThirdSubtitle".localized()
        }
    }
}

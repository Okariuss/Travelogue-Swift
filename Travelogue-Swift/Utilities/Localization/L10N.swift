//
//  L10N.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 23.04.2024.
//

import Foundation

final class L10N {
    private init() {}
    
    static let appTitle = "Travelogue"
    static let launchSubtitle = NSLocalizedString("launch.subtitle", comment: "Launch Screen Subtitle")
    
    static let onboardSkip = NSLocalizedString("onboard.skip", comment: "Onboard Screen Skip Button")
    static let onboardFirstHeader = NSLocalizedString("onboard.firstHeader", comment: "Onboard First Header")
    static let onboardFirstSubtitle = NSLocalizedString("onboard.firstSubtitle", comment: "Onboard First Subtitle")
    static let onboardSecondHeader = NSLocalizedString("onboard.secondHeader", comment: "Onboard Second Header")
    static let onboardSecondSubtitle = NSLocalizedString("onboard.secondSubtitle", comment: "Onboard Second Subtitle")
    static let onboardThirdHeader = NSLocalizedString("onboard.thirdHeader", comment: "Onboard Third Header")
    static let onboardThirdSubtitle = NSLocalizedString("onboard.thirdSubtitle", comment: "Onboard Third Subtitle")
}

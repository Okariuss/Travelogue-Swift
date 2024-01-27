//
//  Theme.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 24.01.2024.
//

import Foundation
import UIKit

struct Theme {
    let themeColor: ThemeColor
    let themeFont: ThemeFont
}


extension Theme {
    static var defaultTheme: Theme {
        return Theme(
            themeColor: ThemeColor(
                primaryBackgroundColor: .primaryBackground,
                secondaryBackgroundColor: .secondaryBackground,
                primaryLabelColor: .primaryLabel,
                onboardSelectedCircleColor: .onboardSelectedCircle,
                onboardUnselectedCircleColor: .onboardUnselectedCircle
            ),
            themeFont: ThemeFont(
                headlineFont: .systemFont(ofSize: TextSizeEnums.subHeadline.rawValue),
                bodyFont: .systemFont(ofSize: TextSizeEnums.caption.rawValue)
            )
        )
    }
}

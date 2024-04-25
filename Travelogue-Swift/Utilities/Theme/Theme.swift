//
//  Theme.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 23.04.2024.
//

import Foundation
import UIKit

struct ThemeFont {
    let extraLargeFont: UIFont
    let largeTitleFont: UIFont
    let titleFont: UIFont
    let mediumTitleFont: UIFont
    let bodyFont: UIFont
    let captionFont: UIFont
    let smallFont: UIFont
    let extraSmallFont: UIFont
}

struct Theme {
    let themeFont: ThemeFont
}

extension Theme {
    
    static func defaultTheme(_ fontName: String? = nil) -> Theme {
        if let fontName {
            return Theme(
                themeFont: ThemeFont(
                    extraLargeFont: UIFont(name: fontName, size: AppConstants.FontSize.extraLargeTitle.rawValue)!.boldVersion,
                    largeTitleFont: UIFont(name: fontName, size: AppConstants.FontSize.largeTitle.rawValue)!.boldVersion,
                    titleFont: UIFont(name: fontName, size: AppConstants.FontSize.title.rawValue)!.boldVersion,
                    mediumTitleFont: UIFont(name: fontName, size: AppConstants.FontSize.mediumTitle.rawValue)!.boldVersion,
                    bodyFont: UIFont(name: fontName, size: AppConstants.FontSize.body.rawValue)!,
                    captionFont: UIFont(name: fontName, size: AppConstants.FontSize.caption.rawValue)!,
                    smallFont: UIFont(name: fontName, size: AppConstants.FontSize.small.rawValue)!,
                    extraSmallFont: UIFont(name: fontName, size: AppConstants.FontSize.extraSmall.rawValue)!
                )
            )
        }
        return Theme(
            themeFont: ThemeFont(
                extraLargeFont: AppConstants.FontSize.extraLargeTitle.toFont.boldVersion,
                largeTitleFont: AppConstants.FontSize.largeTitle.toFont.boldVersion,
                titleFont: AppConstants.FontSize.title.toFont.boldVersion,
                mediumTitleFont: AppConstants.FontSize.mediumTitle.toFont.boldVersion,
                bodyFont: AppConstants.FontSize.body.toFont,
                captionFont: AppConstants.FontSize.caption.toFont,
                smallFont: AppConstants.FontSize.small.toFont,
                extraSmallFont: AppConstants.FontSize.extraSmall.toFont
            )
        )
    }
//    static var defaultTheme: Theme {
//        return Theme(
//            themeFont: ThemeFont(
//                extraLargeFont: AppConstants.FontSize.extraLargeTitle.toFont.boldVersion,
//                largeTitleFont: AppConstants.FontSize.largeTitle.toFont.boldVersion,
//                titleFont: AppConstants.FontSize.title.toFont.boldVersion,
//                mediumTitleFont: AppConstants.FontSize.mediumTitle.toFont.boldVersion,
//                bodyFont: AppConstants.FontSize.body.toFont,
//                captionFont: AppConstants.FontSize.caption.toFont,
//                smallFont: AppConstants.FontSize.small.toFont,
//                extraSmallFont: AppConstants.FontSize.extraSmall.toFont
//            )
//        )
//    }
//    
//    static var customTheme: Theme {
//        let customFontName = AppConstants.FontName.bilboSwash.rawValue
//        return Theme(
//            themeFont: ThemeFont(
//                extraLargeFont: UIFont(name: customFontName, size: AppConstants.FontSize.extraLargeTitle.rawValue)!.boldVersion,
//                largeTitleFont: UIFont(name: customFontName, size: AppConstants.FontSize.largeTitle.rawValue)!.boldVersion,
//                titleFont: UIFont(name: customFontName, size: AppConstants.FontSize.title.rawValue)!.boldVersion,
//                mediumTitleFont: UIFont(name: customFontName, size: AppConstants.FontSize.mediumTitle.rawValue)!.boldVersion,
//                bodyFont: UIFont(name: customFontName, size: AppConstants.FontSize.body.rawValue)!,
//                captionFont: UIFont(name: customFontName, size: AppConstants.FontSize.caption.rawValue)!,
//                smallFont: UIFont(name: customFontName, size: AppConstants.FontSize.small.rawValue)!,
//                extraSmallFont: UIFont(name: customFontName, size: AppConstants.FontSize.extraSmall.rawValue)!
//            )
//        )
//    }
}

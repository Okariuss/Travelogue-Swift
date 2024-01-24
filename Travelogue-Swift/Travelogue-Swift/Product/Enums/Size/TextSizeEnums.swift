//
//  TextSizeEnums.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 12.01.2024.
//

import Foundation


enum TextSizeEnums {
    case smallCaption
    case caption
    case body
    case subHeadline
    case headline
    
    var rawValue: CGFloat {
        switch self {
        case .smallCaption:
            return 16
        case .caption:
            return 20
        case .body:
            return 28
        case .subHeadline:
            return 32
        case .headline:
            return 64
        }
    }
}

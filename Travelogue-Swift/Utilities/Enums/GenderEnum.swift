//
//  GenderEnum.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 3.05.2024.
//

import Foundation


protocol DropableEnum {
    var displayName: String { get }
}

enum GenderEnum: String, DropableEnum {
    
    case male
    case female
    
    var displayName: String {
        switch self {
        case .male:
            return L10N.signUpMale
        case .female:
            return L10N.signUpFemale
        }
    }
}


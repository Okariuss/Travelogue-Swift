//
//  AnimationEnums.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 12.01.2024.
//

import Foundation

enum AnimationEnums {
    case plane
    case bus

    var rawValue: String {
        switch self {
        case .plane:
            return "plane"
        case .bus:
            return "bus"
        }
        
    }
    
    var getAnimName: String {
        return animName(rawValue)
    }
    
    private func animName(_ path: String) -> String {
        return "anim_\(path)"
    }
    
}

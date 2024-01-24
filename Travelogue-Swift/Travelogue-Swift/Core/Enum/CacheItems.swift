//
//  CacheItems.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 24.01.2024.
//

import Foundation

enum CacheItems {
    case token
    case isFirst
    case isLogin

    var key: String {
        switch self {
        case .token: return "token"
        case .isFirst: return "isFirst"
        case .isLogin: return "isLogin"
        }
    }

    var readString: String {
        return UserDefaults.standard.string(forKey: key) ?? ""
    }

    func writeString(_ value: String) {
        UserDefaults.standard.set(value, forKey: key)
    }

    var readBool: Bool {
        if self == .isFirst {
            return UserDefaults.standard.bool(forKey: key) 
        } else {
            return UserDefaults.standard.bool(forKey: key)
        }
    }

    func writeBool(_ value: Bool) {
        UserDefaults.standard.set(value, forKey: key)
    }
}

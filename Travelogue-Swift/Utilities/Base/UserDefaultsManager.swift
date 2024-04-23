//
//  UserDefaultsManager.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 23.04.2024.
//

import Foundation

struct UserDefaultsManager<T> {
    let key: String

    init(key: String) {
        self.key = key
    }

    var value: T? {
        get {
            return UserDefaults.standard.value(forKey: key) as? T
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }

    func remove() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}

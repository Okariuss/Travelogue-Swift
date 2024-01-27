//
//  String+Extension.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 27.01.2024.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", value: self, comment: self)
    }
}

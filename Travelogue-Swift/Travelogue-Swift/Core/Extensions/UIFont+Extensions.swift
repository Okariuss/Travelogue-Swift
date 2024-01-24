//
//  UIFont+Extension.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 24.01.2024.
//

import UIKit

extension UIFont {
    var boldVersion: UIFont {
        guard let descriptor = fontDescriptor.withSymbolicTraits(.traitBold) else {
            return self
        }

        return UIFont(descriptor: descriptor, size: .zero) /// 0 is keep to orjinal size
    }
}

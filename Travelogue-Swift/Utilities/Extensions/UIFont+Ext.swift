//
//  UIFont+Ext.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 23.04.2024.
//

import Foundation
import UIKit

extension UIFont {
    var boldVersion: UIFont {
        guard let descriptor = fontDescriptor.withSymbolicTraits(.traitBold) else {
            return self
        }

        return UIFont(descriptor: descriptor, size: .zero)
    }
    
    var italicVersion: UIFont {
        guard let descriptor = fontDescriptor.withSymbolicTraits(.traitItalic) else {
            return self
        }

        return UIFont(descriptor: descriptor, size: .zero)
    }
}

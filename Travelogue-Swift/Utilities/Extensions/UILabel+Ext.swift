//
//  UILabel+Ext.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 24.04.2024.
//

import Foundation
import UIKit

extension UILabel {
    
    func addGestureRecognizer(for action: Selector, target: Any) {
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tapGesture)
    }
    
    var underlinedText: String? {
        get {
            return attributedText?.string
        }
        set {
            guard let newValue = newValue else {
                attributedText = nil
                return
            }
            let attributedString = NSMutableAttributedString(string: newValue)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}

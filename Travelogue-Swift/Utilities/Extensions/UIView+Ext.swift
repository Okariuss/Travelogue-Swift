//
//  UIView+Ext.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 22.04.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

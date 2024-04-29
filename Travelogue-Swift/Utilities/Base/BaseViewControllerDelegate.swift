//
//  BaseViewControllerDelegate.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 26.04.2024.
//

import Foundation
import UIKit

protocol BaseViewControllerDelegate: AnyObject {
    func configure()
    func navigateScreen(_ vc: UIViewController)
    func previousScreen()
}

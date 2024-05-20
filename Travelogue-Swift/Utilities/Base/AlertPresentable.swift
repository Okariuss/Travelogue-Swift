//
//  AlertPresentable.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 30.04.2024.
//

import Foundation
import UIKit

protocol AlertPresentable {
    func showAlert(title: String, message: String, acceptAction: @escaping () -> Void)
}

extension AlertPresentable where Self: UIViewController {
    func showAlert(title: String, message: String, acceptAction: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            acceptAction()
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
}

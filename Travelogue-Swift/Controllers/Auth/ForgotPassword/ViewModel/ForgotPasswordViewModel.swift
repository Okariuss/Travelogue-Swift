//
//  ForgotPasswordViewModel.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 28.04.2024.
//

import Foundation
import UIKit
import FirebaseAuth

protocol ForgotPasswordViewModelDelegate: BaseViewModelDelegate {
    func resetPasswordTapped(_ email: UITextField)
}

final class ForgotPasswordViewModel<T: ForgotPasswordViewControllerDelegate> {
    weak var view: T?
}

extension ForgotPasswordViewModel: ForgotPasswordViewModelDelegate {
    func viewDidLoad() {
        view?.configure()
    }
    
    func resetPasswordTapped(_ email: UITextField) {
        guard let emailText = email.text, !emailText.isEmpty else {
            view?.showAlert(title: L10N.alertErrorTitle, message: "Please enter your email", acceptAction: {})
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: emailText) { error in
            if let error = error {
                self.view?.showAlert(title: L10N.alertErrorTitle, message: error.localizedDescription, acceptAction: {})
            } else {
                self.view?.showAlert(title: L10N.alertErrorTitle, message: "Password reset link has been sent to your email.", acceptAction: {
                    self.view?.resetTapped()
                })
                
            }
        }
        
        
    }
}

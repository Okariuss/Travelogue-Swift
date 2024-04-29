//
//  LoginViewModel.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 24.04.2024.
//

import Foundation

protocol LoginViewModelDelegate: BaseViewModelDelegate {
    func forgotPassword()
    func signUp()
}

final class LoginViewModel<T: LoginViewControllerDelegate> {
    weak var view: T?
}

extension LoginViewModel: LoginViewModelDelegate {
    
    func viewDidLoad() {
        view?.configure()
    }
    
    func forgotPassword() {
        view?.navigateScreen(ForgotPasswordViewController())
    }
    
    func signUp() {
        view?.navigateScreen(SignUpViewController())
    }
    
}

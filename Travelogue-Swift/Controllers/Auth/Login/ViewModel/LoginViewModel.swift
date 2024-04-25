//
//  LoginViewModel.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 24.04.2024.
//

import Foundation

protocol LoginViewModelDelegate {
    var view: LoginViewControllerDelegate? { get set }
    func viewDidLoad()
    func forgotPassword()
    func signUp()
}

final class LoginViewModel {
    weak var view: LoginViewControllerDelegate?
}

extension LoginViewModel: LoginViewModelDelegate {
    
    func viewDidLoad() {
        view?.configure()
    }
    
    func forgotPassword() {
        view?.navigateScreen(TabBarViewController())
    }
    
    func signUp() {
        view?.navigateScreen(TabBarViewController())
    }
    
}

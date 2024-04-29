//
//  SignUp2ViewModel.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 29.04.2024.
//

import Foundation

protocol SignUp2ViewModelDelegate: BaseViewModelDelegate {
    func signUpButtonTapped()
    func backButtonTapped()
    func signInButtonTapped()
}

final class SignUp2ViewModel<T: SignUp2ViewControllerDelegate> {
    weak var view: T?
}

extension SignUp2ViewModel: SignUp2ViewModelDelegate {
    func viewDidLoad() {
        view?.configure()
    }
    
    func signUpButtonTapped() {
        view?.navigateScreen(TabBarViewController())
    }
    
    func backButtonTapped() {
        view?.previousScreen()
    }
    
    func signInButtonTapped() {
        view?.signInButtonTapped()
    }
}

//
//  SignUpViewModel.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 29.04.2024.
//

import Foundation

protocol SignUpViewModelDelegate: BaseViewModelDelegate {
    func nextButtonTapped()
    func backButtonTapped()
}

final class SignUpViewModel<T: SignUpViewControllerDelegate> {
    weak var view: T?
}

extension SignUpViewModel: SignUpViewModelDelegate {
    func viewDidLoad() {
        view?.configure()
    }
    
    func nextButtonTapped() {
        view?.navigateScreen(SignUp2ViewController())
    }
    
    func backButtonTapped() {
        view?.previousScreen()
    }
}

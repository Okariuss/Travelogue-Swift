//
//  SignUpViewModel.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 29.04.2024.
//

import Foundation

protocol SignUpViewModelDelegate: BaseViewModelDelegate, ValidationManager {
    func nextButtonTapped(name: String, surname: String, email: String, genderIndex: Int?)
    func backButtonTapped()
}

final class SignUpViewModel<T: SignUpViewControllerDelegate> {
    weak var view: T?
}

extension SignUpViewModel: SignUpViewModelDelegate {
    func viewDidLoad() {
        view?.configure()
    }
    
    func nextButtonTapped(name: String, surname: String, email: String, genderIndex: Int?) {
        if validationCheck(name: name, surname: surname, email: email, genderIndex: genderIndex) {
            view?.navigateScreen(SignUp2ViewController(name: name, surname: surname, email: email, genderIndex: genderIndex))
        }
    }
    
    func backButtonTapped() {
        view?.previousScreen()
    }
    
    private func validationCheck(name: String, surname: String, email: String, genderIndex: Int?) -> Bool {
        guard !name.isEmpty, !surname.isEmpty, !email.isEmpty, (genderIndex != nil) else {
            view?.showAlert(title: L10N.alertErrorTitle, message: L10N.alertFillAll, acceptAction: {})
            return false
        }
        
        guard isValidEmail(email: email) else {
            view?.showAlert(title: L10N.alertErrorTitle, message: L10N.alertInvalidEmail, acceptAction: {})
            return false
        }
        return true
    }
}

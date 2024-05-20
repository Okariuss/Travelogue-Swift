//
//  SignUp2ViewModel.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 29.04.2024.
//

import Foundation

protocol SignUp2ViewModelDelegate: BaseViewModelDelegate, ValidationManager {
    func signUpButtonTapped(date: Date, password: String, confirmPassword: String)
    func backButtonTapped()
    func signInButtonTapped()
}

final class SignUp2ViewModel<T: SignUp2ViewControllerDelegate> {
    weak var view: T?
    
    private let name: String
    private let surname: String
    private let email: String
    private let genderIndex: Int?
    private let coreDataManager = CoreDataManager<UserEntity>(entityName: "UserEntity")
    
    init(name: String, surname: String, email: String, genderIndex: Int?) {
        self.name = name
        self.surname = surname
        self.email = email
        self.genderIndex = genderIndex
    }
}

extension SignUp2ViewModel: SignUp2ViewModelDelegate {
    func viewDidLoad() {
        view?.configure()
    }
    
    func signUpButtonTapped(date: Date, password: String, confirmPassword: String) {
        validationCheck(date: date, password: password, confirmPassword: confirmPassword)
        let user = User(name: name, surname: surname, email: email, dateOfBirth: date, gender: GenderEnum.fromIndex(genderIndex!)!.displayName)
        Task {
            do {
                let _ = try await NetworkManager.shared.signUp(user: user, password: password)
                
                let userEntity = coreDataManager.create()
                userEntity.update(from: user)
                coreDataManager.saveContext()
                
                var isLoginManager = UserDefaultsManager<Bool>(key: AppConstants.UserDefaultsEnums.isLogin.rawValue)
                isLoginManager.value = true
                await view?.navigateScreen(TabBarViewController())
            } catch {
                view?.showAlert(title: "Sign Up Error", message: error.localizedDescription, acceptAction: {})
            }
        }
    }
    
    func backButtonTapped() {
        view?.previousScreen()
    }
    
    func signInButtonTapped() {
        view?.signInButtonTapped()
    }
    
    private func validationCheck(date: Date, password: String, confirmPassword: String) {
        
        guard !date.description.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            view?.showAlert(title: L10N.alertErrorTitle, message: L10N.alertFillAll, acceptAction: {})
            return
        }
        
        guard isValidPassword(password: password) else {
            view?.showAlert(title: L10N.alertErrorTitle, message: L10N.alertInvalidPassword, acceptAction: {})
            return
        }
        
        guard password == confirmPassword else {
            view?.showAlert(title: L10N.alertErrorTitle, message: L10N.alertPasswordNotMatchError, acceptAction: {})
            return
        }
    }
}

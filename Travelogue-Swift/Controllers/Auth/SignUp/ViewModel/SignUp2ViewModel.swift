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
    private let coreDataManager = CoreDataManager<UserEntity>(entityName: AppConstants.Entities.userEntity.rawValue)
    
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
        if validationCheck(date: date, password: password, confirmPassword: confirmPassword) {
            let user = User(name: name, surname: surname, email: email, dateOfBirth: date, gender: GenderEnum.fromIndex(genderIndex!)!.displayName)
            Task {
                do {
                    let authResult = try await NetworkManager.shared.signUp(user: user, password: password)
                    
                    let userEntity = coreDataManager.create()
                    userEntity.update(from: user)
                    coreDataManager.saveContext()
                    
                    try await NetworkManager.shared.saveData(data: userEntity, collection: AppConstants.Collections.users.rawValue, documentId: authResult.user.uid)
                    
                    var isLoginManager = UserDefaultsManager<Bool>(key: AppConstants.UserDefaultsEnums.isLogin.rawValue)
                    isLoginManager.value = true
                    
                    DispatchQueue.main.async {
                        self.view?.navigateScreen(TabBarViewController())
                    }
                    
                } catch {
                    DispatchQueue.main.async {
                        self.view?.showAlert(title: "Sign Up Error", message: "Email and password didn't match", acceptAction: {})
                    }
                }
            }
        }
    }
    
    func backButtonTapped() {
        view?.previousScreen()
    }
    
    func signInButtonTapped() {
        view?.signInButtonTapped()
    }
    
    private func validationCheck(date: Date, password: String, confirmPassword: String) -> Bool {
        
        guard !date.description.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            view?.showAlert(title: L10N.alertErrorTitle, message: L10N.alertFillAll, acceptAction: {})
            return false
        }
        
        guard isValidPassword(password: password) else {
            view?.showAlert(title: L10N.alertErrorTitle, message: L10N.alertInvalidPassword, acceptAction: {})
            return false
        }
        
        guard password == confirmPassword else {
            view?.showAlert(title: L10N.alertErrorTitle, message: L10N.alertPasswordNotMatchError, acceptAction: {})
            return false
        }
        
        return true
    }
}

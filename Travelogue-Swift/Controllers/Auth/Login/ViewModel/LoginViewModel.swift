//
//  LoginViewModel.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 24.04.2024.
//

import Foundation
import CoreData
import UIKit

protocol LoginViewModelDelegate: BaseViewModelDelegate, ValidationManager {
    func forgotPassword()
    func signUp()
    func signIn(email: String, password: String)
}

final class LoginViewModel<T: LoginViewControllerDelegate> {
    weak var view: T?
    private let coreDataManager = CoreDataManager<UserEntity>(entityName: AppConstants.Entities.userEntity.rawValue)

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
    
    func signIn(email: String, password: String) {
        if validationCheck(email: email, password: password) {
            Task {
                do {
                    let authResult = try await NetworkManager.shared.signIn(email: email, password: password)
                    let userEntities: [UserEntity] = try await NetworkManager.shared.fetchData(collection: AppConstants.Collections.users.rawValue, context: coreDataManager.context)
                    
                    if let userEntity = userEntities.first(where: { $0.email == email }) {
                        // User is found, proceed with login
                        let entity = coreDataManager.create()
                        entity.update(from: userEntity.toUser())
                        coreDataManager.saveContext()
                        
                        var isLoginManager = UserDefaultsManager<Bool>(key: AppConstants.UserDefaultsEnums.isLogin.rawValue)
                        isLoginManager.value = true
                        
                        DispatchQueue.main.async {
                            self.view?.navigateToMain(TabBarViewController())
                        }
                    } else {
                        // User not found
                        DispatchQueue.main.async {
                            self.view?.showAlert(title: L10N.loginError, message: L10N.loginErrorMessage, acceptAction: {})
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.view?.showAlert(title: L10N.loginError, message: L10N.loginPasswordError, acceptAction: {})
                    }
                }
            }
        }
    }
    
    private func validationCheck(email: String, password: String) -> Bool {
        
        guard isValidEmail(email: email) else {
            view?.showAlert(title: L10N.alertErrorTitle, message: L10N.alertInvalidEmail, acceptAction: {})
            return false
        }
        
        guard isValidPassword(password: password) else {
            view?.showAlert(title: L10N.alertErrorTitle, message: L10N.alertInvalidPassword, acceptAction: {})
            return false
        }
        return true
    }
}

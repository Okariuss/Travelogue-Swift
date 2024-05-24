//
//  LoginViewModel.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 24.04.2024.
//

import Foundation
import CoreData
import UIKit
import FirebaseAuth

protocol LoginViewModelDelegate: BaseViewModelDelegate, ValidationManager {
    func forgotPassword()
    func signUp()
    func signIn(email: String, password: String)
    func googleSignIn()
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
        guard validationCheck(email: email, password: password) else { return }
        
        Task {
            do {
                try await handleSignIn(email: email, password: password)
            } catch {
                DispatchQueue.main.async {
                    self.view?.showAlert(title: L10N.loginError, message: L10N.loginPasswordError, acceptAction: {})
                }
            }
        }
    }
    
    private func handleSignIn(email: String, password: String) async throws {
        let _ = try await NetworkManager.shared.signIn(email: email, password: password)
        let userEntities: [UserEntity] = try await NetworkManager.shared.fetchData(collection: AppConstants.Collections.users.rawValue, context: coreDataManager.context)
        
        if let userEntity = userEntities.first(where: { $0.email == email }) {
            loginUser(userEntity: userEntity)
        } else {
            DispatchQueue.main.async {
                self.view?.showAlert(title: L10N.loginError, message: L10N.loginErrorMessage, acceptAction: {})
            }
        }
    }
    
    func googleSignIn() {
        Task {
            do {
                try await handleGoogleSignIn()
            } catch {
                DispatchQueue.main.async {
                    self.view?.showAlert(title: L10N.loginError, message: error.localizedDescription, acceptAction: {})
                }
            }
        }
    }
    
    private func handleGoogleSignIn() async throws {
        guard let viewController = view as? UIViewController else { return }
        
        let result = try await NetworkManager.shared.googleSignIn(viewController)
        let userEntities: [UserEntity] = try await NetworkManager.shared.fetchData(collection: AppConstants.Collections.users.rawValue, context: coreDataManager.context)
        
        if let userEntity = userEntities.first(where: { $0.email == result.user.email }) {
            loginUser(userEntity: userEntity)
        } else {
            try await createNewGoogleUser(result: result)
        }
    }
    
    private func createNewGoogleUser(result: AuthDataResult) async throws {
        let user = User(
            name: result.user.displayName ?? "",
            surname: result.user.displayName ?? "",
            email: result.user.email ?? "",
            dateOfBirth: Date(),
            gender: "",
            profilePhoto: nil
        )
        
        let userEntity = coreDataManager.create()
        userEntity.update(from: user)
        coreDataManager.saveContext()
        
        try await NetworkManager.shared.saveData(data: userEntity, collection: AppConstants.Collections.users.rawValue, documentId: result.user.uid)
        setLoginStateAndNavigate()
    }
    
    private func loginUser(userEntity: UserEntity) {
        let entity = coreDataManager.create()
        entity.update(from: userEntity.toUser())
        coreDataManager.saveContext()
        
        setLoginStateAndNavigate()
    }
    
    private func setLoginStateAndNavigate() {
        var isLoginManager = UserDefaultsManager<Bool>(key: AppConstants.UserDefaultsEnums.isLogin.rawValue)
        isLoginManager.value = true
        
        DispatchQueue.main.async {
            self.view?.navigateToMain(TabBarViewController())
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

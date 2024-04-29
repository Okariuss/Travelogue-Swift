//
//  ForgotPasswordViewModel.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 28.04.2024.
//

import Foundation

protocol ForgotPasswordViewModelDelegate: BaseViewModelDelegate {
    func resetPasswordTapped()
}

final class ForgotPasswordViewModel<T: ForgotPasswordViewControllerDelegate> {
    weak var view: T?
}

extension ForgotPasswordViewModel: ForgotPasswordViewModelDelegate {
    func viewDidLoad() {
        view?.configure()
    }
    
    func resetPasswordTapped() {
        view?.resetTapped()
    }
}

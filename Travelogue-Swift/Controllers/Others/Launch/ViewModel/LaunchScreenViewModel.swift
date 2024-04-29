//
//  LaunchScreenViewModel.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 28.04.2024.
//

import Foundation
import UIKit

protocol LaunchScreenViewModelDelegate: BaseViewModelDelegate {
    
}

final class LaunchScreenViewModel <T: LaunchScreenViewControllerDelegate> {
    weak var view: T?
}

extension LaunchScreenViewModel: LaunchScreenViewModelDelegate {
    func viewDidLoad() {
        view?.configure()
        checkAndNavigate()
    }
    
    private func checkAndNavigate() {
        let isFirstManager = UserDefaultsManager<Bool>(key: AppConstants.UserDefaultsEnums.isFirst.rawValue)
        let isLoginManager = UserDefaultsManager<Bool>(key: AppConstants.UserDefaultsEnums.isLogin.rawValue)
        
        let viewController = (isFirstManager.value ?? true) ? OnboardViewController() : ((isLoginManager.value ?? false) ? TabBarViewController() : LoginViewController())
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.tintColor = .text
//        navController.navigationBar.isHidden = false
//        navController.navigationBar.backgroundColor = .red
//        navController.navigationBar.barTintColor = .text
        view?.navigateScreen(navController)
    }
    
}

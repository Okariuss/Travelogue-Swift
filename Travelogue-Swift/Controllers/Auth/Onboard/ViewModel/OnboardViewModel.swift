//
//  OnboardViewModel.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 23.04.2024.
//

import Foundation

protocol OnboardViewModelDelegate: BaseViewModelDelegate {
    func didTapNext()
    func didTapBack()
    func didSelectPage(at index: Int)
}

final class OnboardViewModel<T: OnboardViewControllerDelegate> {
    weak var view: T?
    var selectedIndex = 0
    let onboardElements: [OnboardModel] = [
        OnboardModel(
            image: AppConstants.Images.onboard1.toImage,
            title: L10N.onboardFirstHeader,
            subtitle: L10N.onboardFirstSubtitle
        ),
        OnboardModel(
            image: AppConstants.Images.onboard2.toImage,
            title: L10N.onboardSecondHeader,
            subtitle: L10N.onboardSecondSubtitle
        ),
        OnboardModel(
            image: AppConstants.Images.onboard3.toImage,
            title: L10N.onboardThirdHeader,
            subtitle: L10N.onboardThirdSubtitle
        )
    ]
}

extension OnboardViewModel: OnboardViewModelDelegate {
    
    func viewDidLoad() {
        view?.configure()
    }
    
    func didTapNext() {
        selectedIndex += 1
        
        if selectedIndex < onboardElements.count {
            view?.updateUI(model: onboardElements[selectedIndex], index: selectedIndex)
        } else {
            var isFirst = UserDefaultsManager<Bool>(key: AppConstants.UserDefaultsEnums.isFirst.rawValue)
            isFirst.value = false
            let isLoginManager = UserDefaultsManager<Bool>(key: AppConstants.UserDefaultsEnums.isLogin.rawValue)
            let viewController = (isLoginManager.value ?? false) ? TabBarViewController() : LoginViewController()
            view?.navigateScreen(viewController)
        }
    }
    
    func didTapBack() {
        if selectedIndex > 0 {
            selectedIndex -= 1
            view?.updateUI(model: onboardElements[selectedIndex], index: selectedIndex)
        }
    }
    
    func didSelectPage(at index: Int) {
        if index >= 0 && index < onboardElements.count {
            selectedIndex = index
            view?.updateUI(model: onboardElements[selectedIndex], index: selectedIndex)
        }
    }
}

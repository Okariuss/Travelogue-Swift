//
//  OnboardViewModel.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 23.04.2024.
//

import Foundation

protocol OnboardViewModelDelegate {
    var view: OnboardViewControllerDelegate? { get set }
    func viewDidLoad()
    func didTapNext()
    func didTapBack()
    func didSelectPage(at: Int)
}

final class OnboardViewModel {
    weak var view: OnboardViewControllerDelegate?
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
            view?.navigateScreen()
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

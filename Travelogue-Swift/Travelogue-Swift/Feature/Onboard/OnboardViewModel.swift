//
//  OnboardViewModel.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 24.01.2024.
//

import Foundation

protocol OnboardViewModelDelegate: AnyObject {
    func didOnboardFinish()
}

protocol OnboardViewModelType {
    var items: [OnboardModel] { get }
    var currentPage: Int { get }
    var numberOfPages: Int { get }
    
    func nextButtonTapped()
    func skipButtonTapped()
}

class OnboardViewModel: OnboardViewModelType {
    weak var delegate: OnboardViewModelDelegate?
        
    private(set) var currentPage: Int = 0
    private let onboardingItems: [OnboardModel]
        
    init() {
        self.onboardingItems = [
            OnboardModel(image: ImageEnums.travel, header: StringEnums.onboardFirstHeader.rawValue, subtitle: StringEnums.onboardFirstSubtitle.rawValue),
            OnboardModel(image: ImageEnums.hotel, header: StringEnums.onboardSecondHeader.rawValue, subtitle: StringEnums.onboardSecondSubtitle.rawValue),
            OnboardModel(image: ImageEnums.needHelp, header: StringEnums.onboardThirdHeader.rawValue, subtitle: StringEnums.onboardThirdSubtitle.rawValue)
            
        ]
    }
        
    var items: [OnboardModel] {
        return onboardingItems
    }
        
    var numberOfPages: Int {
        return onboardingItems.count
    }
        
    func nextButtonTapped() {
        if currentPage < numberOfPages - 1 {
            currentPage += 1
        } else {
            delegate?.didOnboardFinish()
        }
    }
        
    func skipButtonTapped() {
        delegate?.didOnboardFinish()
    }
}

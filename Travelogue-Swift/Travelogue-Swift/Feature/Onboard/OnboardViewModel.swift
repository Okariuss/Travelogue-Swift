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
            OnboardModel(image: ImageEnums.travel, header: "Want Travel?", subtitle: "Decide where do you want to go, find your ticket and travel."),
            OnboardModel(image: ImageEnums.hotel, header: "Need Hotel?", subtitle: "You can sort all the hotels in your destination according to price, star and comfort and you can choose the most beautiful hotel."),
            OnboardModel(image: ImageEnums.needHelp, header: "Need Help?", subtitle: "You can contact us by mail, phone number or live chat. We will assist you in everything.")
            
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

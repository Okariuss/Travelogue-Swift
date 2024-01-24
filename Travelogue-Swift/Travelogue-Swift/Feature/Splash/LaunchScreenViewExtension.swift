//
//  LaunchScreenViewExtension.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 24.01.2024.
//

import Lottie
import UIKit

extension LaunchScreenViewController {
     static func createAnim(name: String) -> LottieAnimationView {
         let anim = LottieAnimationView(name: name)
         anim.translatesAutoresizingMaskIntoConstraints = false
         anim.contentMode = .scaleAspectFit
         anim.loopMode = .loop
         anim.play()
         return anim
    }
    
    static func topSplashItemsConfigureConstraints(in viewController: LaunchScreenViewController) {
        let planeAnimationViewConstraints = [
            viewController.planeAnimationView.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            viewController.planeAnimationView.topAnchor.constraint(equalTo: viewController.view.topAnchor, constant: SpaceEnums.normal.rawValue),
            viewController.planeAnimationView.widthAnchor.constraint(equalToConstant: CGFloat(ImageSizeEnums.normal.rawValue)),
            viewController.planeAnimationView.heightAnchor.constraint(equalToConstant: CGFloat(ImageSizeEnums.normal.rawValue))
        ]
        
        let appIconViewConstraints = [
            viewController.appIconView.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            viewController.appIconView.topAnchor.constraint(equalTo: viewController.planeAnimationView.bottomAnchor),
            viewController.appIconView.widthAnchor.constraint(equalToConstant: CGFloat(ImageSizeEnums.medium.rawValue)),
            viewController.appIconView.heightAnchor.constraint(equalToConstant: CGFloat(ImageSizeEnums.medium.rawValue))
        ]
        
        NSLayoutConstraint.activate(planeAnimationViewConstraints)
        NSLayoutConstraint.activate(appIconViewConstraints)
    }
    
    static func centerSplashItemsConfigureConstraints(in viewController: LaunchScreenViewController) {
        
        let travelogueSplashViewConstraints = [
            viewController.travelogueSplashTextView.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            viewController.travelogueSplashTextView.topAnchor.constraint(equalTo: viewController.appIconView.bottomAnchor, constant: SpaceEnums.small.rawValue)
        ]
        
        let splashTextViewConstraints = [
            viewController.splashTextView.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            viewController.splashTextView.topAnchor.constraint(equalTo: viewController.travelogueSplashTextView.bottomAnchor, constant: SpaceEnums.small.rawValue)
        ]
        
        NSLayoutConstraint.activate(travelogueSplashViewConstraints)
        NSLayoutConstraint.activate(splashTextViewConstraints)
    }
    
    static func bottomSplashItemsConfigureConstraints(in viewController: LaunchScreenViewController) {
        let busAnimationViewConstraints = [
            viewController.busAnimationView.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            viewController.busAnimationView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor, constant: -SpaceEnums.normal.rawValue),
            viewController.busAnimationView.widthAnchor.constraint(equalToConstant: CGFloat(ImageSizeEnums.normal.rawValue)),
            viewController.busAnimationView.heightAnchor.constraint(equalToConstant: CGFloat(ImageSizeEnums.normal.rawValue))
        ]
        
        
        NSLayoutConstraint.activate(busAnimationViewConstraints)
    }
}


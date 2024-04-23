//
//  LaunchScreenViewController.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 22.04.2024.
//

import UIKit
import Lottie

enum AnimationPosition {
    case top, bottom
}

final class LaunchScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        transitionToMainViewController()
    }
    
    private func setupUI() {
        view.backgroundColor = .background
        
        let topAnimationView = createAnimationView(named: AppConstants.AnimationName.plane.rawValue)
        
        let bottomAnimationView = createAnimationView(named: AppConstants.AnimationName.travelBus.rawValue)
        
        let titleLabel = createLabel(text: L10N.appTitle, isTitle: true)
        let subtitleLabel = createLabel(text: L10N.launchSubtitle)
        
        let imageView = UIImageView(image: AppConstants.Images.appImage.toImage)
        imageView.contentMode = .scaleAspectFit
        
        view.addSubviews(topAnimationView, bottomAnimationView, imageView, titleLabel, subtitleLabel)
        addAnimationToView(topAnimationView, at: .top)
        addAnimationToView(bottomAnimationView, at: .bottom)
        
        addConstraintsForLabelsAndImage(topAnimationView, titleLabel, subtitleLabel, imageView)
    }
    
    private func addAnimationToView(_ animationView: LottieAnimationView, at position: AnimationPosition) {
        animationView.loopMode = .loop
        
        var constraints: [NSLayoutConstraint] = []
        switch position {
        case .top:
            constraints = [
                animationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ]
        case .bottom:
            constraints = [
                animationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ]
        }
        
        constraints += [
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animationView.heightAnchor.constraint(equalToConstant: AppConstants.ImageSize.extraLarge.rawValue)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        animationView.play()
    }
    
    private func createAnimationView(named animationName: String) -> LottieAnimationView {
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named(animationName)
        animationView.contentMode = .scaleAspectFit
        return animationView
    }
    
    private func createLabel(text: String, isTitle: Bool = false) -> UILabel {
        let label = UILabel()
        label.font = isTitle ? Theme.customTheme.themeFont.extraLargeFont : Theme.defaultTheme.themeFont.bodyFont
        label.text = text
        label.textAlignment = .center
        label.textColor = .black
        return label
    }
    
    private func addConstraintsForLabelsAndImage(_ topAnimationView: UIView, _ titleLabel: UILabel, _ subtitleLabel: UILabel, _ imageView: UIImageView) {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnimationView.bottomAnchor, constant: AppConstants.Spacing.medium.rawValue),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: AppConstants.ImageSize.xxLarge.rawValue),
            imageView.heightAnchor.constraint(equalToConstant: AppConstants.ImageSize.xxLarge.rawValue),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: AppConstants.Spacing.medium.rawValue),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: AppConstants.Spacing.medium.rawValue),
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func transitionToMainViewController() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let manager = UserDefaultsManager<Bool>(key: AppConstants.UserDefaultsEnums.isFirst.rawValue)
            
            let viewController = (manager.value ?? true) ? OnboardViewController() : TabBarViewController()
            viewController.modalPresentationStyle = .fullScreen
            viewController.modalTransitionStyle = .partialCurl
            self.present(viewController, animated: true)
        }
    }
}

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
            animationView.heightAnchor.constraint(equalToConstant: AppConstants.ImageSize.extraLarge)
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
        label.font = UIFont(name: AppConstants.FontName.title, size: isTitle ? AppConstants.FontSize.extraLargeTitle : AppConstants.FontSize.largeTitle)
        label.text = text
        label.textAlignment = .center
        label.textColor = .black
        return label
    }
    
    private func addConstraintsForLabelsAndImage(_ topAnimationView: UIView, _ titleLabel: UILabel, _ subtitleLabel: UILabel, _ imageView: UIImageView) {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnimationView.bottomAnchor, constant: AppConstants.Spacing.medium),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: AppConstants.ImageSize.xxLarge),
            imageView.heightAnchor.constraint(equalToConstant: AppConstants.ImageSize.xxLarge),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: AppConstants.Spacing.medium),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: AppConstants.Spacing.medium),
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func transitionToMainViewController() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let mainViewController = TabBarViewController()
            mainViewController.modalPresentationStyle = .fullScreen
            self.present(mainViewController, animated: true, completion: nil)
        }
    }
}

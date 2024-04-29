//
//  LaunchScreenViewController.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 22.04.2024.
//

import UIKit
import Lottie

protocol LaunchScreenViewControllerDelegate: BaseViewControllerDelegate {
    
}

enum AnimationPosition {
    case top, bottom
}

final class LaunchScreenViewController: UIViewController {
    
    private lazy var topAnimationView = addAnimationView(named: AppConstants.AnimationName.plane.rawValue)
    
    private lazy var bottomAnimationView = addAnimationView(named: AppConstants.AnimationName.travelBus.rawValue)
    
    private lazy var titleLabel = addLabel(text: L10N.appTitle, font: Theme.defaultTheme(AppConstants.FontName.bilboSwash.rawValue).themeFont.extraLargeFont)
    
    private lazy var subtitleLabel = addLabel(text: L10N.launchSubtitle, font: Theme.defaultTheme().themeFont.bodyFont)
    
    private lazy var imageView = addImageView(image: AppConstants.Images.appImage.toImage)
    
    private lazy var viewModel: LaunchScreenViewModel<LaunchScreenViewController> = LaunchScreenViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension LaunchScreenViewController: LaunchScreenViewControllerDelegate {
    func configure() {
        view.backgroundColor = .background
        view.addSubviews(topAnimationView, bottomAnimationView, imageView, titleLabel, subtitleLabel)
        addAnimationToView(topAnimationView, at: .top)
        addAnimationToView(bottomAnimationView, at: .bottom)
        
        addConstraintsForLabelsAndImage(topAnimationView, titleLabel, subtitleLabel, imageView)
    }
    
    func navigateScreen(_ vc: UIViewController) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            self.present(vc, animated: true)
        }
    }
    
    func previousScreen() {
        
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
}

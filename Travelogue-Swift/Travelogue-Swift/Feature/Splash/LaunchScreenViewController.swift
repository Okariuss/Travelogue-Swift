//
//  LaunchScreenViewController.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 12.01.2024.
//

import UIKit
import Lottie

class LaunchScreenViewController: UIViewController {
    
    private let planeAnimationView: LottieAnimationView = createAnim(name: AnimationEnums.plane.getAnimName)
    
    private let appIconView: UIImageView = {
        let appIcon = UIImageView(frame: .zero)
        appIcon.image = ImageEnums.icon.toImage
        appIcon.translatesAutoresizingMaskIntoConstraints = false
        appIcon.contentMode = .scaleAspectFill
        return appIcon
    }()
    
    private let travelogueSplashTextView: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = StringConstants.appName
        text.font = UIFont(name: StringConstants.bilboSwashCaps, size: TextSizeEnums.extraLarge.rawValue)
        return text
    }()
    
    private let splashTextView: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = StringConstants.splashText
        text.font = UIFont(name: StringConstants.aldrich, size: TextSizeEnums.normal.rawValue)
        return text
    }()
    
    private let busAnimationView: LottieAnimationView = createAnim(name: AnimationEnums.bus.getAnimName)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBackground
        
        setDesign()
        
        skipSplash()
        
    }
    
    private func setDesign() {
        view.addSubview(planeAnimationView)
        view.addSubview(appIconView)
        view.addSubview(travelogueSplashTextView)
        view.addSubview(splashTextView)
        view.addSubview(busAnimationView)
        
        configureConstraints()
    }
    
    private func skipSplash() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            let viewController = MainTabbarViewController()
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true)
        }
    }
    
    private func configureConstraints() {
        
        LaunchScreenViewController.topSplashItemsConfigureConstraints(in: self)
        LaunchScreenViewController.centerSplashItemsConfigureConstraints(in: self)
        LaunchScreenViewController.bottomSplashItemsConfigureConstraints(in: self)
    }

}

private extension LaunchScreenViewController {
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

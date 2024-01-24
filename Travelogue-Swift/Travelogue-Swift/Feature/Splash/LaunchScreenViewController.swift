//
//  LaunchScreenViewController.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 12.01.2024.
//

import UIKit
import Lottie

class LaunchScreenViewController: UIViewController {
    
    let planeAnimationView: LottieAnimationView = createAnim(name: AnimationEnums.plane.getAnimName)
    
    let appIconView: UIImageView = {
        let appIcon = UIImageView(frame: .zero)
        appIcon.image = ImageEnums.icon.toImage
        appIcon.translatesAutoresizingMaskIntoConstraints = false
        appIcon.contentMode = .scaleAspectFill
        return appIcon
    }()
    
    let travelogueSplashTextView: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = StringConstants.appName
        text.font = UIFont(name: StringConstants.bilboSwashCaps, size: TextSizeEnums.headline.rawValue)?.boldVersion
        return text
    }()
    
    let splashTextView: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = StringConstants.splashText
        text.font = UIFont(name: StringConstants.aldrich, size: TextSizeEnums.caption.rawValue)
        return text
    }()
    
    let busAnimationView: LottieAnimationView = createAnim(name: AnimationEnums.bus.getAnimName)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBackground
        
        setDesign()
        
        skipSplash()
        
    }
    
     func setDesign() {
        view.addSubview(planeAnimationView)
        view.addSubview(appIconView)
        view.addSubview(travelogueSplashTextView)
        view.addSubview(splashTextView)
        view.addSubview(busAnimationView)
        
        configureConstraints()
    }
    
     func skipSplash() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            let viewController = MainTabbarViewController()
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true)
        }
    }
    
     func configureConstraints() {
        
        LaunchScreenViewController.topSplashItemsConfigureConstraints(in: self)
        LaunchScreenViewController.centerSplashItemsConfigureConstraints(in: self)
        LaunchScreenViewController.bottomSplashItemsConfigureConstraints(in: self)
    }

}


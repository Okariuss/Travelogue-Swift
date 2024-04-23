//
//  TabBarViewController.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 22.04.2024.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .background
        setTabs()
    }
    
}

private extension TabBarViewController {
    private func setTabs() {
        let homeVC = generateTab(on: HomeViewController(), image: AppConstants.SystemImages.house.normal.withTintColor(.secondaryLabel, renderingMode: .alwaysOriginal), selectedImage: AppConstants.SystemImages.house.toSelected.withTintColor(.label, renderingMode: .alwaysOriginal))
        let homeVC2 = generateTab(on: HomeViewController(), image: AppConstants.SystemImages.house.normal.withTintColor(.secondaryLabel, renderingMode: .alwaysOriginal), selectedImage: AppConstants.SystemImages.house.toSelected.withTintColor(.label, renderingMode: .alwaysOriginal))

        
        setViewControllers([homeVC, homeVC2], animated: true)
    }
    
    private func generateTab(on view: UIViewController, image: UIImage, selectedImage: UIImage) -> UINavigationController {
        let nav = UINavigationController(rootViewController: view)
        nav.tabBarItem = UITabBarItem(title: "", image: image, selectedImage: selectedImage)
        return nav
    }
}

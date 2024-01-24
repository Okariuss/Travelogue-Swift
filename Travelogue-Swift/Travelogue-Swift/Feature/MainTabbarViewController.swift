//
//  MainTabbarViewController.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 12.01.2024.
//

import UIKit

class MainTabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setTabs()
    }
    
    
}

private extension MainTabbarViewController {
    private func setTabs() {
        let homeVC = generateTab(on: HomeViewController(), image: SystemImageEnums.house.normal!, selectedImage: SystemImageEnums.house.toSelected!)
        
        let favoriteVC = generateTab(on: FavoriteViewController(), image: SystemImageEnums.favorite.normal!, selectedImage: SystemImageEnums.favorite.toSelected!)
        
        setViewControllers([homeVC, favoriteVC], animated: true)
    }
    
    private func generateTab(on view: UIViewController, image: UIImage, selectedImage: UIImage) -> UINavigationController {
        let nav = UINavigationController(rootViewController: view)
        nav.tabBarItem = UITabBarItem(title: "", image: image, selectedImage: selectedImage)
        return nav
    }
}

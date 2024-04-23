//
//  HomeViewController.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 22.04.2024.
//

import UIKit

final class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
    }
    
    private func setupBackground() {
        // Create a UIImageView with the background image
        let backgroundImage = AppConstants.Images.background.toImage
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true // Ensure the image doesn't overflow
        
        // Add the background image view to the view controller's main view
        view.addSubviews(backgroundImageView)
        
        // Send the background image view to the back so other views are on top
        view.sendSubviewToBack(backgroundImageView)
        
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//
//  HomeViewController.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 22.04.2024.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let coreDataManager = CoreDataManager<UserEntity>(entityName: "UserEntity")
    private var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        fetchUserInfo()
        setupUserInfoLabel()
    }
    
    private func setupBackground() {
        let backgroundImage = AppConstants.Images.background.toImage
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        
        view.addSubviews(backgroundImageView)
        
        view.sendSubviewToBack(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func fetchUserInfo() {
        if let userEntities = coreDataManager.fetchAll(), let userEntity = userEntities.first {
            user = userEntity.toUser()
        }
    }
    
    private func setupUserInfoLabel() {
        guard let user = user else { return }
        
        let userInfoLabel = UILabel()
        userInfoLabel.text = "Name: \(user.name)\nSurname: \(user.surname)\nEmail: \(user.email)\nDOB: \(user.dateOfBirth)\nGender: \(user.gender)"
        userInfoLabel.numberOfLines = 0
        userInfoLabel.textAlignment = .center
        userInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        userInfoLabel.textColor = .text
        
        view.addSubview(userInfoLabel)
        
        NSLayoutConstraint.activate([
            userInfoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userInfoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

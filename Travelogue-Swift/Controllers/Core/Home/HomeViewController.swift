//
//  HomeViewController.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 22.04.2024.
//

import UIKit
import CoreData

final class HomeViewController: UIViewController {
    
    private let coreDataManager = CoreDataManager<UserEntity>(entityName: "UserEntity")
    private var user: User?
    
    private lazy var userInfoLabel: UILabel = {
        return addLabel(text: "")
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(userInfoLabel)
        setupBackground()
        fetchUserInfo()
        updateUserInfoLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchUserInfo()
        updateUserInfoLabel()
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
            user = User(
                name: userEntity.name ?? "",
                surname: userEntity.surname ?? "",
                email: userEntity.email ?? "",
                dateOfBirth: userEntity.dateOfBirth ?? Date(),
                gender: userEntity.gender ?? ""
            )
        } else {
            user = nil
        }
    }
    
    private func updateUserInfoLabel() {
        if let user = user {
            userInfoLabel.text = """
            Name: \(user.name)
            Surname: \(user.surname)
            Email: \(user.email)
            DOB: \(user.dateOfBirth)
            Gender: \(user.gender)
            """
        } else {
            userInfoLabel.text = "Not available user"
        }
    }
}

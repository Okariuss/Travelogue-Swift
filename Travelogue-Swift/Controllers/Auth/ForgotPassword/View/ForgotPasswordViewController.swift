//
//  ForgotPasswordViewController.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 28.04.2024.
//

import UIKit

protocol ForgotPasswordViewControllerDelegate: BaseViewControllerDelegate {
    func resetTapped()
}

final class ForgotPasswordViewController: UIViewController {
    
    private lazy var imageView = addImageView(image: AppConstants.Images.appImage.toImage)
    
    private lazy var forgotPasswordLabel = addLabel(text: L10N.loginForgotPassword, font: Theme.defaultTheme(AppConstants.FontName.alfaSlab.rawValue).themeFont.largeTitleFont)
    
    private lazy var descriptionLabel = addLabel(text: L10N.forgotPasswordDescription, font: Theme.defaultTheme().themeFont.mediumTitleFont.italicVersion)
    
    private lazy var emailTextField = CustomTextField(type: .email, placeholderText: L10N.loginEmail, image: AppConstants.SystemImages.mail.toSelected)

    private lazy var resetPasswordButton = CustomButton(gradientColors: [.background, .black], title: L10N.forgotPasswordReset)

    private lazy var viewModel: ForgotPasswordViewModel<ForgotPasswordViewController> = ForgotPasswordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    @objc private func didTap() {
        viewModel.resetPasswordTapped()
    }
}

extension ForgotPasswordViewController: ForgotPasswordViewControllerDelegate {
    func configure() {
        view.backgroundColor = .background
        view.addSubviews(imageView, forgotPasswordLabel, descriptionLabel, emailTextField, resetPasswordButton)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.widthAnchor.constraint(equalToConstant: AppConstants.ImageSize.xxLarge.rawValue),
            imageView.heightAnchor.constraint(equalToConstant: AppConstants.ImageSize.xxLarge.rawValue),
            
            forgotPasswordLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            forgotPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.Spacing.medium.rawValue),
            forgotPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -AppConstants.Spacing.medium.rawValue),
            
            descriptionLabel.topAnchor.constraint(equalTo: forgotPasswordLabel.bottomAnchor, constant: AppConstants.Spacing.medium.rawValue),
            descriptionLabel.leadingAnchor.constraint(equalTo: forgotPasswordLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: forgotPasswordLabel.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: AppConstants.Spacing.medium.rawValue),
            emailTextField.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: AppConstants.TextFieldHeight.medium.rawValue),
            
            resetPasswordButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: AppConstants.Spacing.medium.rawValue),
            resetPasswordButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            resetPasswordButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            resetPasswordButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor)
        ])
        
        resetPasswordButton.addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }
    
    func navigateScreen(_ vc: UIViewController) {
        self.navigationController?.navigationBar.tintColor = .text
        self.navigationController?.modalTransitionStyle = .crossDissolve
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func resetTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

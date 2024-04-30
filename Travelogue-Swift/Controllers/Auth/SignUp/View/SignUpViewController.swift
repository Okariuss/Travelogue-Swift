//
//  SignUpViewController.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 29.04.2024.
//

import UIKit

protocol SignUpViewControllerDelegate: BaseViewControllerDelegate {
    
}

final class SignUpViewController: UIViewController {
    private lazy var imageView: UIImageView = {
        return addImageView(image: AppConstants.Images.appImage.toImage)
    }()
    
    private lazy var welcomeTextLabel: UILabel = {
        return addLabel(text: L10N.loginWelcomeBack, font: Theme.defaultTheme(AppConstants.FontName.alfaSlab.rawValue).themeFont.extraLargeFont)
    }()
    
    private lazy var signUpDescriptionLabel: UILabel = {
        return addLabel(text: L10N.signUpDescription, font: Theme.defaultTheme().themeFont.mediumTitleFont.italicVersion)
    }()
    
    private lazy var nameTextField = CustomTextField(type: .email, placeholderText: L10N.signUpName, image: AppConstants.SystemImages.card.normal)
    
    private lazy var surnameTextField = CustomTextField(type: .email, placeholderText: L10N.signUpSurname, image: AppConstants.SystemImages.card.normal)
    
    private lazy var emailTextField = CustomTextField(type: .email, placeholderText: L10N.loginEmail, image: AppConstants.SystemImages.mail.toSelected)
    
    private lazy var nextButton = CustomButton(gradientColors: [.background, .black], title: L10N.signUpNext)
    
    private lazy var haveAccountLabel: UILabel = {
        return addLabel(text: L10N.signUpHaveAccount)
    }()
    
    private lazy var signInLabel: UILabel = {
        return addLabel(isUnderlined: true, text: L10N.loginSignIn.capitalized)
    }()
    
    private lazy var viewModel: SignUpViewModel<SignUpViewController> = SignUpViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    @objc private func didTapNext() {
        viewModel.nextButtonTapped()
    }
    
    @objc private func didTapSignIn() {
        viewModel.backButtonTapped()
    }
}

extension SignUpViewController: SignUpViewControllerDelegate {
    
    func configure() {
        view.backgroundColor = .background
        
        view.addSubviews(imageView, welcomeTextLabel, signUpDescriptionLabel, nameTextField, surnameTextField, emailTextField, nextButton, haveAccountLabel, signInLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.Spacing.medium.rawValue),
            imageView.widthAnchor.constraint(equalToConstant: AppConstants.ImageSize.big.rawValue),
            imageView.heightAnchor.constraint(equalToConstant: AppConstants.ImageSize.big.rawValue),
            
            welcomeTextLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            welcomeTextLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            
            signUpDescriptionLabel.topAnchor.constraint(equalTo: welcomeTextLabel.bottomAnchor),
            signUpDescriptionLabel.leadingAnchor.constraint(equalTo: welcomeTextLabel.leadingAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: signUpDescriptionLabel.bottomAnchor, constant: AppConstants.Spacing.medium.rawValue),
            nameTextField.leadingAnchor.constraint(equalTo: signUpDescriptionLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -AppConstants.Spacing.medium.rawValue),
            nameTextField.heightAnchor.constraint(equalToConstant: AppConstants.TextFieldHeight.medium.rawValue),
            
            surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: AppConstants.Spacing.small.rawValue),
            surnameTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            surnameTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            surnameTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: AppConstants.Spacing.small.rawValue),
            emailTextField.leadingAnchor.constraint(equalTo: surnameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: surnameTextField.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalTo: surnameTextField.heightAnchor),
            
            nextButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: AppConstants.Spacing.small.rawValue),
            nextButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            nextButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            haveAccountLabel.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: AppConstants.Spacing.medium.rawValue),
            haveAccountLabel.leadingAnchor.constraint(equalTo: nextButton.leadingAnchor),
            
            signInLabel.topAnchor.constraint(equalTo: haveAccountLabel.topAnchor),
            signInLabel.leadingAnchor.constraint(equalTo: haveAccountLabel.trailingAnchor)
        ])
        
        nextButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        signInLabel.addGestureRecognizer(for: #selector(didTapSignIn), target: self)
    }
    
    func navigateScreen(_ vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

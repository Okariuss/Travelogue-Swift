//
//  SignUp2ViewController.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 29.04.2024.
//

import UIKit

protocol SignUp2ViewControllerDelegate: BaseViewControllerDelegate {
    func signInButtonTapped()
}

final class SignUp2ViewController: UIViewController {
    
    private let name: String
    private let surname: String
    private let email: String
    private let genderIndex: Int?
    
    private lazy var imageView: UIImageView = {
        return addImageView(image: AppConstants.Images.appImage.toImage)
    }()
    
    private lazy var welcomeTextLabel: UILabel = {
        return addLabel(text: L10N.loginWelcomeBack, font: Theme.defaultTheme(AppConstants.FontName.alfaSlab.rawValue).themeFont.extraLargeFont)
    }()
    
    private lazy var signUpDescriptionLabel: UILabel = {
        return addLabel(text: L10N.signUpDescription, font: Theme.defaultTheme().themeFont.mediumTitleFont.italicVersion)
    }()
    
    private lazy var datePicker = CustomDatePicker(placeholder: L10N.signUpDateOfBirthday, image: AppConstants.SystemImages.card.normal)
    
    private lazy var passwordTextField = CustomTextField(type: .password(secure: true), placeholderText: L10N.loginPassword, image: AppConstants.SystemImages.key.toSelected)
    
    private lazy var confirmPasswordTextField = CustomTextField(type: .password(secure: true), placeholderText: L10N.signUpConfirmPassword, image: AppConstants.SystemImages.key.toSelected)
    
    private lazy var createAccountButton = CustomButton(gradientColors: [.background, .black], title: L10N.signUpCreateAccount)
    
    private lazy var haveAccountLabel: UILabel = {
        return addLabel(text: L10N.signUpHaveAccount)
    }()
    
    private lazy var signInLabel: UILabel = {
        return addLabel(isUnderlined: true, text: L10N.loginSignIn.capitalized)
    }()
    
    private lazy var viewModel: SignUp2ViewModel<SignUp2ViewController> = SignUp2ViewModel(name: name, surname: surname, email: email, genderIndex: genderIndex)
    
    init(name: String, surname: String, email: String, genderIndex: Int?) {
        self.name = name
        self.surname = surname
        self.email = email
        self.genderIndex = genderIndex
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    @objc private func didCreateAccountTapped() {
        viewModel.signUpButtonTapped(date: datePicker.datePicker.date, password: passwordTextField.text!, confirmPassword: confirmPasswordTextField.text!)
    }
    
    @objc private func didSignInButtonTapped() {
        viewModel.signInButtonTapped()
    }
}

extension SignUp2ViewController: SignUp2ViewControllerDelegate {
    
    func configure() {
        view.backgroundColor = .background
        
        view.addSubviews(imageView, welcomeTextLabel, signUpDescriptionLabel, datePicker, passwordTextField, confirmPasswordTextField, createAccountButton, haveAccountLabel, signInLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.Spacing.medium.rawValue),
            imageView.widthAnchor.constraint(equalToConstant: AppConstants.ImageSize.big.rawValue),
            imageView.heightAnchor.constraint(equalToConstant: AppConstants.ImageSize.big.rawValue),
            
            welcomeTextLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            welcomeTextLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            
            signUpDescriptionLabel.topAnchor.constraint(equalTo: welcomeTextLabel.bottomAnchor),
            signUpDescriptionLabel.leadingAnchor.constraint(equalTo: welcomeTextLabel.leadingAnchor),
            
            datePicker.topAnchor.constraint(equalTo: signUpDescriptionLabel.bottomAnchor, constant: AppConstants.Spacing.small.rawValue),
            datePicker.leadingAnchor.constraint(equalTo: signUpDescriptionLabel.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -AppConstants.Spacing.medium.rawValue),
            datePicker.heightAnchor.constraint(equalToConstant: AppConstants.TextFieldHeight.xxLarge.rawValue),
            
            passwordTextField.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: AppConstants.Spacing.small.rawValue),
            passwordTextField.leadingAnchor.constraint(equalTo: datePicker.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: datePicker.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: AppConstants.TextFieldHeight.medium.rawValue),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: AppConstants.Spacing.small.rawValue),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            confirmPasswordTextField.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor),
            
            createAccountButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: AppConstants.Spacing.small.rawValue),
            createAccountButton.leadingAnchor.constraint(equalTo: confirmPasswordTextField.leadingAnchor),
            createAccountButton.trailingAnchor.constraint(equalTo: confirmPasswordTextField.trailingAnchor),
            createAccountButton.heightAnchor.constraint(equalTo: confirmPasswordTextField.heightAnchor),
            
            haveAccountLabel.topAnchor.constraint(equalTo: createAccountButton.bottomAnchor, constant: AppConstants.Spacing.small.rawValue),
            haveAccountLabel.leadingAnchor.constraint(equalTo: createAccountButton.leadingAnchor),
            
            signInLabel.topAnchor.constraint(equalTo: haveAccountLabel.topAnchor),
            signInLabel.leadingAnchor.constraint(equalTo: haveAccountLabel.trailingAnchor)
        ])
        
        createAccountButton.addTarget(self, action: #selector(didCreateAccountTapped), for: .touchUpInside)
        
        signInLabel.addGestureRecognizer(for: #selector(didSignInButtonTapped), target: self)
    }
    
    func navigateScreen(_ vc: UIViewController) {
        DispatchQueue.main.async {
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            self.present(vc, animated: true)
        }
    }
    
    func signInButtonTapped() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

//
//  LoginViewController.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 24.04.2024.
//

import UIKit

protocol LoginViewControllerDelegate: BaseViewControllerDelegate {
    func updateUI()
    func navigateToMain(_ vc: UIViewController)
}

final class LoginViewController: UIViewController {
    private lazy var imageView: UIImageView = {
        return addImageView(image: AppConstants.Images.appImage.toImage)
    }()
    
    private lazy var welcomeTextLabel: UILabel = {
        return addLabel(text: L10N.loginWelcomeBack, font: Theme.defaultTheme(AppConstants.FontName.alfaSlab.rawValue).themeFont.extraLargeFont)
    }()
    
    private lazy var signInTextLabel: UILabel = {
        return addLabel(text: L10N.loginSignInContinue, font: Theme.defaultTheme().themeFont.mediumTitleFont.italicVersion)
    }()
    
    private lazy var emailTextField = CustomTextField(type: .email, placeholderText: L10N.loginEmail, image: AppConstants.SystemImages.mail.toSelected)
    
    private lazy var passwordTextField = CustomTextField(type: .password(secure: true), placeholderText: L10N.loginPassword, image: AppConstants.SystemImages.key.toSelected)
    
    private lazy var forgotPasswordLabel: UILabel = {
        return addLabel(isUnderlined: true, text: L10N.loginForgotPassword)
    }()
    
    private lazy var signInButton = CustomButton(gradientColors: [.background, .black], title: L10N.loginSignIn)
    
    private lazy var googleSignInButton = CustomButton(gradientColors: [.systemBlue, .white], title: L10N.loginGoogleSignIn)
    
    private lazy var dontHaveAccountLabel: UILabel = {
        return addLabel(text: L10N.loginDontHaveAccount)
    }()
    
    private lazy var signUpLabel: UILabel = {
        return addLabel(isUnderlined: true, text: L10N.loginSignUp)
    }()
    
    private lazy var viewModel: LoginViewModel<LoginViewController> = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    @objc private func forgotPasswordTapped() {
        viewModel.forgotPassword()
    }
    
    @objc private func signUpTapped() {
        viewModel.signUp()
    }
    
    @objc private func signInTapped() {
        viewModel.signIn(email: emailTextField.text!, password: passwordTextField.text!)
    }
    
    @objc private func googleSignInTapped() {
        viewModel.googleSignIn()
    }
}

extension LoginViewController: LoginViewControllerDelegate {
    
    func configure() {
        view.backgroundColor = .background
        setupTransition()
        
        forgotPasswordLabel.addGestureRecognizer(for: #selector(forgotPasswordTapped), target: self)
        signUpLabel.addGestureRecognizer(for: #selector(signUpTapped), target: self)
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        googleSignInButton.addTarget(self, action: #selector(googleSignInTapped), for: .touchUpInside)
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            
        }
    }
    
    func navigateScreen(_ vc: UIViewController) {
        self.navigationController?.navigationBar.tintColor = .text
        self.navigationController?.modalTransitionStyle = .partialCurl
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToMain(_ vc: UIViewController) {
        DispatchQueue.main.async {
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            self.present(vc, animated: true)
        }
    }
    
    private func animateTransition(imageCons: [NSLayoutConstraint], textCons: [NSLayoutConstraint]) {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            NSLayoutConstraint.deactivate(imageCons + textCons)
            
            NSLayoutConstraint.activate([
                self.imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                self.imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: AppConstants.Spacing.medium.rawValue),
                self.imageView.widthAnchor.constraint(equalToConstant: AppConstants.ImageSize.big.rawValue),
                self.imageView.heightAnchor.constraint(equalToConstant: AppConstants.ImageSize.big.rawValue),
                
                self.welcomeTextLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor),
                self.welcomeTextLabel.leadingAnchor.constraint(equalTo: self.imageView.leadingAnchor),
            ])
            
            // Apply font change animation to the welcomeTextLabel
            UIView.transition(with: self.welcomeTextLabel, duration: 0.5, options: .curveEaseInOut, animations: {
                self.welcomeTextLabel.font = Theme.defaultTheme(AppConstants.FontName.alfaSlab.rawValue).themeFont.largeTitleFont
            })
            
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.view.addSubviews(
                self.signInTextLabel,
                self.emailTextField,
                self.passwordTextField,
                self.forgotPasswordLabel,
                self.signInButton,
                self.googleSignInButton,
                self.dontHaveAccountLabel,
                self.signUpLabel
            )
            
            NSLayoutConstraint.activate([
                self.signInTextLabel.topAnchor.constraint(equalTo: self.welcomeTextLabel.bottomAnchor),
                self.signInTextLabel.leadingAnchor.constraint(equalTo: self.welcomeTextLabel.leadingAnchor),
                
                self.emailTextField.topAnchor.constraint(equalTo: self.signInTextLabel.bottomAnchor, constant: AppConstants.Spacing.medium.rawValue),
                self.emailTextField.leadingAnchor.constraint(equalTo: self.welcomeTextLabel.leadingAnchor),
                self.emailTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -AppConstants.Spacing.medium.rawValue),
                self.emailTextField.heightAnchor.constraint(equalToConstant: AppConstants.TextFieldHeight.medium.rawValue),
                
                self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: AppConstants.Spacing.medium.rawValue),
                self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
                self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
                self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
                
                self.forgotPasswordLabel.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: AppConstants.Spacing.medium.rawValue),
                self.forgotPasswordLabel.leadingAnchor.constraint(equalTo: self.passwordTextField.leadingAnchor),
                
                self.signInButton.topAnchor.constraint(equalTo: self.forgotPasswordLabel.bottomAnchor, constant: AppConstants.Spacing.medium.rawValue),
                self.signInButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
                self.signInButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
                self.signInButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
                
                self.googleSignInButton.topAnchor.constraint(equalTo: self.signInButton.bottomAnchor, constant: AppConstants.Spacing.medium.rawValue),
                self.googleSignInButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
                self.googleSignInButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
                self.googleSignInButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
                
                self.dontHaveAccountLabel.topAnchor.constraint(equalTo: self.googleSignInButton.bottomAnchor, constant: AppConstants.Spacing.medium.rawValue),
                self.dontHaveAccountLabel.leadingAnchor.constraint(equalTo: self.googleSignInButton.leadingAnchor),
                
                self.signUpLabel.topAnchor.constraint(equalTo: self.dontHaveAccountLabel.topAnchor),
                self.signUpLabel.leadingAnchor.constraint(equalTo: self.dontHaveAccountLabel.trailingAnchor)
            ])
        })
    }
    
    private func setupTransition() {
        view.addSubviews(imageView, welcomeTextLabel)
        
        let imageCons: [NSLayoutConstraint] = [
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -AppConstants.ImageSize.xxLarge.rawValue / 3),
            imageView.widthAnchor.constraint(equalToConstant: AppConstants.ImageSize.xxLarge.rawValue),
            imageView.heightAnchor.constraint(equalToConstant: AppConstants.ImageSize.xxLarge.rawValue)
        ]
        
        let textCons: [NSLayoutConstraint] = [
            welcomeTextLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            welcomeTextLabel.centerXAnchor.constraint(equalTo: self.imageView.centerXAnchor),
        ]
        
        NSLayoutConstraint.activate(imageCons + textCons)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.animateTransition(imageCons: imageCons, textCons: textCons)
        }
    }
}

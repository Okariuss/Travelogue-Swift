//
//  L10N.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 23.04.2024.
//

import Foundation

final class L10N {
    private init() {}
    
    static let appTitle = "Travelogue"
    static let launchSubtitle = NSLocalizedString("launch.subtitle", comment: "Launch Screen Subtitle")
    
    static let onboardSkip = NSLocalizedString("onboard.skip", comment: "Onboard Screen Skip Button")
    static let onboardFirstHeader = NSLocalizedString("onboard.firstHeader", comment: "Onboard First Header")
    static let onboardFirstSubtitle = NSLocalizedString("onboard.firstSubtitle", comment: "Onboard First Subtitle")
    static let onboardSecondHeader = NSLocalizedString("onboard.secondHeader", comment: "Onboard Second Header")
    static let onboardSecondSubtitle = NSLocalizedString("onboard.secondSubtitle", comment: "Onboard Second Subtitle")
    static let onboardThirdHeader = NSLocalizedString("onboard.thirdHeader", comment: "Onboard Third Header")
    static let onboardThirdSubtitle = NSLocalizedString("onboard.thirdSubtitle", comment: "Onboard Third Subtitle")
    
    static let loginWelcomeBack = NSLocalizedString("login.welcomeBack", comment: "Welcome Back")
    static let loginSignInContinue = NSLocalizedString("login.signInContinue", comment: "Sign in to continue")
    static let loginEmail = NSLocalizedString("login.email", comment: "E-mail")
    static let loginPassword = NSLocalizedString("login.password", comment: "Password")
    static let loginForgotPassword = NSLocalizedString("login.forgotPassword", comment: "Forgot Password")
    static let loginSignIn = NSLocalizedString("login.signIn", comment: "SIGN IN")
    static let loginGoogleSignIn = NSLocalizedString("login.googleSignIn", comment: "GOOGLE SIGN IN")
    static let loginDontHaveAccount = NSLocalizedString("login.dontHaveAccount", comment: "Don't you have an account? ")
    static let loginSignUp = NSLocalizedString("login.signUp", comment: "Sign Up")
    
    static let forgotPasswordLabel = NSLocalizedString("login.forgotPassword", comment: "Forgot Password")
    static let forgotPasswordDescription = NSLocalizedString("forgotPassword.description", comment: "Forgot password descriptin")
    static let forgotPasswordReset = NSLocalizedString("forgotPassword.reset", comment: "Forgot password reset button")
    
    static let signUpDescription = NSLocalizedString("signUp.description", comment: "Sign up to continue")
    static let signUpName = NSLocalizedString("signUp.name", comment: "Name")
    static let signUpSurname = NSLocalizedString("signUp.surname", comment: "Surname")
    static let signUpNext = NSLocalizedString("signUp.next", comment: "Next")
    static let signUpHaveAccount = NSLocalizedString("signUp.haveAccount", comment: "Already have an account? ")
    static let signUpDateOfBirthday = NSLocalizedString("signUp.dateOfBirthday", comment: "Date of Birthday")
    static let signUpConfirmPassword = NSLocalizedString("signUp.confirmPassword", comment: "Confirm Password")
    static let signUpCreateAccount = NSLocalizedString("signUp.createAccount", comment: "Create Account")
}

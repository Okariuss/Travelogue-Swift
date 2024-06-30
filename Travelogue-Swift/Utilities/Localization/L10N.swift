//
//  L10N.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 23.04.2024.
//

import Foundation

final class L10N {
    private init() {}
    
    // MARK: App Constant
    static let appTitle = "Travelogue"
    static let launchSubtitle = NSLocalizedString("launch.subtitle", comment: "Launch Screen Subtitle")
    
    // MARK: Alert Constants
    static let alertActionOk = NSLocalizedString("alert.ok", comment: "OK")
    static let alertErrorTitle = NSLocalizedString("alert.errorTitle", comment: "Error")
    static let alertFillAll = NSLocalizedString("alert.fillAll", comment: "Please fill in all fields.")
    static let alertInvalidEmail = NSLocalizedString("alert.invalidEmail", comment: "Please enter a valid email address.")
    static let alertInvalidPassword = NSLocalizedString("alert.invalidPassword", comment: "Your password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.")
    static let alertPasswordNotMatchError = NSLocalizedString("alert.passwordNotMatched", comment: "The password and confirm password fields do not match.")

    // MARK: Onboard Constants
    static let onboardSkip = NSLocalizedString("onboard.skip", comment: "Onboard Screen Skip Button")
    static let onboardFirstHeader = NSLocalizedString("onboard.firstHeader", comment: "Onboard First Header")
    static let onboardFirstSubtitle = NSLocalizedString("onboard.firstSubtitle", comment: "Onboard First Subtitle")
    static let onboardSecondHeader = NSLocalizedString("onboard.secondHeader", comment: "Onboard Second Header")
    static let onboardSecondSubtitle = NSLocalizedString("onboard.secondSubtitle", comment: "Onboard Second Subtitle")
    static let onboardThirdHeader = NSLocalizedString("onboard.thirdHeader", comment: "Onboard Third Header")
    static let onboardThirdSubtitle = NSLocalizedString("onboard.thirdSubtitle", comment: "Onboard Third Subtitle")
    
    // MARK: Login Constants
    static let loginWelcomeBack = NSLocalizedString("login.welcomeBack", comment: "Welcome Back")
    static let loginSignInContinue = NSLocalizedString("login.signInContinue", comment: "Sign in to continue")
    static let loginEmail = NSLocalizedString("login.email", comment: "E-mail")
    static let loginPassword = NSLocalizedString("login.password", comment: "Password")
    static let loginForgotPassword = NSLocalizedString("login.forgotPassword", comment: "Forgot Password")
    static let loginSignIn = NSLocalizedString("login.signIn", comment: "SIGN IN")
    static let loginGoogleSignIn = NSLocalizedString("login.googleSignIn", comment: "GOOGLE SIGN IN")
    static let loginDontHaveAccount = NSLocalizedString("login.dontHaveAccount", comment: "Don't you have an account? ")
    static let loginSignUp = NSLocalizedString("login.signUp", comment: "Sign Up")
    static let loginError = NSLocalizedString("login.error", comment: "Sign Up Error")
    static let loginErrorMessage = NSLocalizedString("login.errorMessage", comment: "User not found")
    static let loginPasswordError = NSLocalizedString("login.passwordError", comment: "Password is not correct")
    
    // MARK: Forgot Password Constants
    static let forgotPasswordLabel = NSLocalizedString("login.forgotPassword", comment: "Forgot Password")
    static let forgotPasswordDescription = NSLocalizedString("forgotPassword.description", comment: "Forgot password descriptin")
    static let forgotPasswordReset = NSLocalizedString("forgotPassword.reset", comment: "Forgot password reset button")
    static let forgotPasswordEnterEmail = NSLocalizedString("forgotPassword.enterEmail", comment: "Please enter your email")
    static let forgotPasswordLinkSended = NSLocalizedString("forgotPassword.linkSended", comment: "Password reset link has been sent to your email.")
    
    // MARK: Sign Up Constants
    static let signUpDescription = NSLocalizedString("signUp.description", comment: "Sign up to continue")
    static let signUpName = NSLocalizedString("signUp.name", comment: "Name")
    static let signUpSurname = NSLocalizedString("signUp.surname", comment: "Surname")
    static let signUpNext = NSLocalizedString("signUp.next", comment: "Next")
    static let signUpGender = NSLocalizedString("signUp.gender", comment: "Gender")
    static let signUpMale = NSLocalizedString("signUp.male", comment: "Male")
    static let signUpFemale = NSLocalizedString("signUp.female", comment: "Female")
    static let signUpHaveAccount = NSLocalizedString("signUp.haveAccount", comment: "Already have an account? ")
    static let signUpDateOfBirthday = NSLocalizedString("signUp.dateOfBirthday", comment: "Date of Birthday")
    static let signUpConfirmPassword = NSLocalizedString("signUp.confirmPassword", comment: "Confirm Password")
    static let signUpCreateAccount = NSLocalizedString("signUp.createAccount", comment: "Create Account")
    static let signUpError = NSLocalizedString("signUp.error", comment: "Sign Up Error")
    static let signUpErrorMessage = NSLocalizedString("signUp.errorMessage", comment: "This email address is already in use by another account")
}

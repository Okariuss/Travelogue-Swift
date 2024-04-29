//
//  CustomTextField.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 24.04.2024.
//

//
//  CustomTextField.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 24.04.2024.
//

import UIKit

protocol IconProviding {
    var iconImageView: UIImageView { get }
    func setIcon(image: UIImage?)
}

protocol PasswordToggle {
    var passwordToggleButton: UIButton { get }
    func setupPasswordToggleButton()
}

protocol TextFieldConfigurable {
    var type: CustomTextField.TextFieldType? { get set }
    var placeholderText: String? { get set }
    var placeholderColor: UIColor? { get set }
    func configureTextField()
}


final class CustomTextField: UITextField {
    
    enum TextFieldType {
        case email
        case password(secure: Bool)
    }
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let passwordToggleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(AppConstants.SystemImages.showPassword.normal, for: .normal)
        button.setImage(AppConstants.SystemImages.hidePassword.normal, for: .selected)
        button.tintColor = .text
        return button
    }()
    
    var type: TextFieldType?
    var placeholderText: String?
    var placeholderColor: UIColor?
    
    init(type: TextFieldType, placeholderText: String, placeholderColor: UIColor = .systemGray3, image: UIImage) {
        self.type = type
        self.placeholderText = placeholderText
        self.placeholderColor = placeholderColor
        super.init(frame: .zero)
        setIcon(image: image)
        setupIcon()
        setupPasswordToggleButton()
        addBorderWithRoundedCorners()
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: iconImageView.frame.maxX + 10, y: bounds.origin.y, width: bounds.width - (iconImageView.frame.width + 40), height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
    private func setupIcon() {
        addSubviews(iconImageView, passwordToggleButton)
        
        iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        passwordToggleButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        passwordToggleButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    private func addBorderWithRoundedCorners() {
        layer.cornerRadius = 10
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner]
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.systemGray4.cgColor
        layer.masksToBounds = true
    }
    
}

// MARK: - IconProviding Extension
extension CustomTextField: IconProviding {
    func setIcon(image: UIImage?) {
        iconImageView.image = image?.withTintColor(.systemGray4, renderingMode: .alwaysOriginal)
    }
}

// MARK: - PasswordToggle Extension
extension CustomTextField: PasswordToggle {
    func setupPasswordToggleButton() {
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
    }
    
    @objc func togglePasswordVisibility() {
        isSecureTextEntry = !isSecureTextEntry
        passwordToggleButton.isSelected = !isSecureTextEntry
    }
}

// MARK: - TextFieldConfigurable Extension
extension CustomTextField: TextFieldConfigurable {
    func configureTextField() {
        guard let type = type else { return }
        
        switch type {
        case .email:
            keyboardType = .emailAddress
            isSecureTextEntry = false
            passwordToggleButton.isHidden = true
        case .password(let secure):
            keyboardType = .default
            isSecureTextEntry = secure
            passwordToggleButton.isHidden = false
        }
        
        attributedPlaceholder = NSAttributedString(string: placeholderText ?? "",
                                                   attributes: [NSAttributedString.Key.foregroundColor: placeholderColor ?? UIColor.systemGray3])
    }
}

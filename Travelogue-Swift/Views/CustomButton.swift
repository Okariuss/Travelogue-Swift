//
//  CustomButton.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 24.04.2024.
//

import UIKit

protocol GradientProviding {
    var gradientLayer: CAGradientLayer? { get }
    func setupGradient(colors: [UIColor])
    func layoutGradient()
}

protocol TitleProviding {
    var titleValue: String? { get }
    func setTitleValue(_ title: String?, for state: UIControl.State)
}

final class CustomButton: UIButton {
    
    var gradientLayer: CAGradientLayer?
    var titleValue: String?
    
    init(gradientColors: [UIColor], title: String?) {
        self.titleValue = title
        super.init(frame: .zero)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = Theme.defaultTheme().themeFont.bodyFont
        setupGradient(colors: gradientColors)
        setTitleValue(title, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer?.frame = bounds
    }
}

// MARK: - GradientProviding Extension
extension CustomButton: GradientProviding {
    func setupGradient(colors: [UIColor]) {
        gradientLayer = CAGradientLayer()
        gradientLayer?.frame = bounds
        gradientLayer?.colors = colors.map { $0.cgColor }
        gradientLayer?.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer?.endPoint = CGPoint(x: 1, y: 1)
        
        if let gradientLayer = gradientLayer {
            layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
    func layoutGradient() {
        gradientLayer?.frame = bounds
        if let gradientLayer = gradientLayer {
            layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}

// MARK: - TitleProviding Extension
extension CustomButton: TitleProviding {
    func setTitleValue(_ title: String?, for state: UIControl.State) {
        titleValue = title
        setTitle(title, for: state)
    }
}

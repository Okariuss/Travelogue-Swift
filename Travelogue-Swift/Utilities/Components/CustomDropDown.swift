//
//  CustomDropDown.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 4.05.2024.
//

import Foundation
import UIKit
import iOSDropDown

final class CustomDropDown: UIView {
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let dropDown: DropDown = {
        let dropDown = DropDown()
        dropDown.rowBackgroundColor = .background
        dropDown.selectedRowColor = .background
        dropDown.isSearchEnable = false
        
        dropDown.textColor = .text
        return dropDown
    }()
    
    init(image: UIImage ,placeholder: String, options: [DropableEnum]) {
        super.init(frame: .zero)
        setupView()
        addBorderWithRoundedCorners()
        setIcon(image: image)
        configureDropDown(text: placeholder, options: options)
    }
    
    private func setupView() {
        addSubviews(iconImageView)
        addSubviews(dropDown)
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),
            
            dropDown.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            dropDown.topAnchor.constraint(equalTo: topAnchor),
            dropDown.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            dropDown.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureDropDown(text: String?, options: [DropableEnum]) {
        
        dropDown.optionArray = options.map { $0.displayName }
        if let placeholderText = text {
            let attributedString = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.text])
            dropDown.attributedPlaceholder = attributedString
        }
    }

    private func addBorderWithRoundedCorners() {
        layer.cornerRadius = 10
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner]
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.text.cgColor
        layer.masksToBounds = true
    }
    
    func setIcon(image: UIImage?) {
        iconImageView.image = image?.withTintColor(.text, renderingMode: .alwaysOriginal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

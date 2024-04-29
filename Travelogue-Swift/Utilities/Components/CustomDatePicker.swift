//
//  CustomDatePicker.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 29.04.2024.
//

import Foundation
import UIKit

protocol DatePickerDelegate: AnyObject {
    func datePickerDidChange(date: Date)
}

final class CustomDatePicker: UIControl {
    
    weak var delegate: DatePickerDelegate?
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.tintColor = .text // Customize the picker color as needed
        picker.backgroundColor = .background // Customize the picker background color as needed
        picker.preferredDatePickerStyle = .wheels
        picker.maximumDate = .now
        return picker
    }()
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .placeholderText
        label.textAlignment = .center
        return label
    }()
    
    init(placeholder: String, image: UIImage) {
        super.init(frame: .zero)
        setIcon(image: image)
        setupIcon()
        setupPlaceholder(placeholder)
        setupDatePicker()
        addBorderWithRoundedCorners()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 50) // Adjust height as needed
    }
    
    private func setupIcon() {
        addSubviews(iconImageView)
        
        iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setupDatePicker() {
        addSubviews(datePicker)
        
        datePicker.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10).isActive = true
        datePicker.topAnchor.constraint(equalTo: placeholderLabel.bottomAnchor).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        datePicker.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
    }
    
    private func setupPlaceholder(_ placeholder: String) {
        addSubviews(placeholderLabel)
        
        placeholderLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10).isActive = true
        placeholderLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor).isActive = true
        placeholderLabel.text = placeholder
        placeholderLabel.textColor = .text
    }
    
    private func addBorderWithRoundedCorners() {
        layer.cornerRadius = 10
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner]
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.systemGray4.cgColor
        layer.masksToBounds = true
    }
    
    @objc private func datePickerValueChanged() {
        delegate?.datePickerDidChange(date: datePicker.date)
    }
    
    func setIcon(image: UIImage?) {
        iconImageView.image = image?.withTintColor(.systemGray4, renderingMode: .alwaysOriginal)
    }
}


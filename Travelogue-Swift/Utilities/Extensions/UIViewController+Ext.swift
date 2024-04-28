//
//  UIViewController+Ext.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 26.04.2024.
//

import Foundation
import UIKit
import Lottie

extension UIViewController {
    
    // MARK: Label
    func addLabel(isUnderlined: Bool = false, text: String, color: UIColor? = .text, font: UIFont? = nil) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        isUnderlined ? (label.underlinedText = text) : (label.text = text)
        label.textColor = color
        label.textAlignment = .center
        label.font = font
        return label
    }
    
    // MARK: ImageView
    func addImageView(image: UIImage) -> UIImageView {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    // MARK: Button
    func addButton(hasImage: Bool = false, hasTitle: Bool = false, image: UIImage? = nil, title: String? = nil, tintColor: UIColor, method: Selector, event: UIControl.Event = .touchUpInside) -> UIButton {
        let button = UIButton(type: .system)
        if let image = image, hasImage {
            let tintedImage = image.withRenderingMode(.alwaysTemplate)
            button.setImage(tintedImage, for: .normal)
        }
        if let title = title, hasTitle {
            button.setTitle(title, for: .normal)
        }
        button.tintColor = tintColor
        button.addTarget(self, action: method, for: event)
        return button
    }

    // MARK: PageControl
    func addPageControl(pages: Int, currentIndicatorColor: UIColor, method: Selector) -> UIPageControl {
        let pageControl = UIPageControl(frame: .zero)
        pageControl.numberOfPages = pages
        pageControl.currentPageIndicatorTintColor = currentIndicatorColor
        pageControl.addTarget(self, action: method, for: .valueChanged)
        return pageControl
    }
    
    // MARK: AnimationView
    func addAnimationView(named animationName: String) -> LottieAnimationView {
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named(animationName)
        animationView.contentMode = .scaleAspectFit
        return animationView
    }
}

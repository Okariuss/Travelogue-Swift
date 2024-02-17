//
//  OnboardViewController.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 24.01.2024.
//

import UIKit

class OnboardViewController: UIViewController, OnboardViewModelDelegate {
    func didOnboardFinish() {
        CacheItems.isFirst.writeBool(false)
        DispatchQueue.main.async {
            let viewController = CacheItems.isLogin.readBool ?  MainTabbarViewController() : LoginViewController()
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true)
        }
    }
    
    var viewModel: OnboardViewModel!
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = Theme.defaultTheme.themeFont.headlineFont.boldVersion
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = Theme.defaultTheme.themeFont.bodyFont
        label.textColor = Theme.defaultTheme.themeColor.onboardSelectedCircleColor
        return label
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = .onboardUnselectedCircle
        pageControl.currentPageIndicatorTintColor = .onboardSelectedCircle
        return pageControl
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(SystemImageEnums.forward.normal, for: .normal)
        button.tintColor = Theme.defaultTheme.themeColor.onboardSelectedCircleColor
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(StringEnums.onboardSkip.toLocalized, for: .normal)
        button.setTitleColor(Theme.defaultTheme.themeColor.onboardSelectedCircleColor, for: .normal)
        button.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
}

extension OnboardViewController {
    
    private func configureUI() {
        view.backgroundColor = .secondaryBackground
        
        viewModel = OnboardViewModel()
        viewModel.delegate = self
        
        setDesign()
        
        configureContent()
        
    }
    
    private func setDesign() {
        view.addSubview(imageView)
        view.addSubview(headerLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(pageControl)
        view.addSubview(nextButton)
        view.addSubview(skipButton)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        OnboardViewController.topOnboardItemsConfigureConstraints(in: self)
        OnboardViewController.bottomOnboardItemsConfigureConstraints(in: self)
    }
    
    
    private func configureContent() {
        updateUI()
        pageControl.numberOfPages = viewModel.numberOfPages
    }
        
    private func updateUI() {
        guard let currentItem = viewModel.items[safe: viewModel.currentPage] else {
            return
        }
            
        headerLabel.text = currentItem.header
        subtitleLabel.text = currentItem.subtitle
        imageView.image = currentItem.image.toImage
        pageControl.currentPage = viewModel.currentPage
    }
    
    @objc private func nextButtonTapped(_ sender: UIButton) {
        viewModel.nextButtonTapped()
        updateUI()
    }
    
    @objc private func skipButtonTapped(_ sender: UIButton) {
        viewModel.skipButtonTapped()
    }
    
    static func topOnboardItemsConfigureConstraints(in viewController: OnboardViewController) {
        let imageViewConstraints = [
            viewController.imageView.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            viewController.imageView.topAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.topAnchor, constant: SpaceEnums.small.rawValue),
            viewController.imageView.widthAnchor.constraint(equalToConstant: CGFloat(ImageSizeEnums.medium.rawValue)),
            viewController.imageView.heightAnchor.constraint(equalToConstant: CGFloat(ImageSizeEnums.medium.rawValue))
            
        ]
        
        let headerLabelConstraints = [
            viewController.headerLabel.leadingAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.leadingAnchor),
            viewController.headerLabel.trailingAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.trailingAnchor),
            viewController.headerLabel.topAnchor.constraint(equalTo: viewController.imageView.bottomAnchor, constant: SpaceEnums.extraLarge.rawValue)
        ]
        
        let subtitleLabelConstraints = [
            
            viewController.subtitleLabel.leadingAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.leadingAnchor, constant: SpaceEnums.normal.rawValue),
            viewController.subtitleLabel.trailingAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.trailingAnchor, constant: -SpaceEnums.normal.rawValue),
            viewController.subtitleLabel.topAnchor.constraint(equalTo: viewController.headerLabel.bottomAnchor, constant: SpaceEnums.small.rawValue)
        ]
        
        
        NSLayoutConstraint.activate(imageViewConstraints)
        NSLayoutConstraint.activate(headerLabelConstraints)
        NSLayoutConstraint.activate(subtitleLabelConstraints)
        
    }
    
    static func bottomOnboardItemsConfigureConstraints(in viewController: OnboardViewController) {
        let nextButtonConstraints = [
            viewController.nextButton.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor, constant: -SpaceEnums.large.rawValue),
            viewController.nextButton.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor, constant: -SpaceEnums.large.rawValue),
        ]
        
        let skipButtonConstraints = [
            viewController.skipButton.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor, constant: -SpaceEnums.large.rawValue),
            viewController.skipButton.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor, constant: SpaceEnums.large.rawValue)
        ]
        
        let pageControlConstraints = [
            viewController.pageControl.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor, constant: -SpaceEnums.large.rawValue),
            viewController.pageControl.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
        ]
        
        NSLayoutConstraint.activate(nextButtonConstraints)
        NSLayoutConstraint.activate(skipButtonConstraints)
        NSLayoutConstraint.activate(pageControlConstraints)
    }
}

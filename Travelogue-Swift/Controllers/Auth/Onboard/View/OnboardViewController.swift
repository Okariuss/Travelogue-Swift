//
//  OnboardViewController.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 23.04.2024.
//

import UIKit

protocol OnboardViewControllerDelegate: AnyObject {
    func configure()
    func updateUI(model: OnboardModel, index: Int)
    func navigateScreen()
}

final class OnboardViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: AppConstants.Images.onboard1.toImage)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = L10N.onboardFirstHeader
        label.textColor = .black
        label.font = Theme.defaultTheme().themeFont.largeTitleFont
        label.textAlignment = .center
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = L10N.onboardFirstSubtitle
        label.textColor = .black
        label.font = Theme.defaultTheme().themeFont.bodyFont
        label.textAlignment = .center
        return label
    }()
    
    private let backBtn: UIButton = {
        let button = UIButton(type: .system)
        let originalImage = AppConstants.SystemImages.back.normal
        
        let tintedImage = originalImage.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        
        button.tintColor = .systemGray4
        
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: .zero)
        pageControl.numberOfPages = 3
        pageControl.currentPageIndicatorTintColor = .systemGray4
        
        return pageControl
    }()
    
    private let nextBtn: UIButton = {
        let button = UIButton(type: .system)
        let originalImage = AppConstants.SystemImages.next.normal
        
        let tintedImage = originalImage.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        
        button.tintColor = .systemGray4
        
        return button
    }()
    
    private lazy var viewModel = OnboardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    @objc func didTapBackBtn() {
        viewModel.didTapBack()
    }
    
    @objc func pageControlValueChanged(_ sender: UIPageControl) {
        viewModel.didSelectPage(at: sender.currentPage)
    }
    
    @objc func didTapNextBtn() {
        viewModel.didTapNext()
    }
}

extension OnboardViewController: OnboardViewControllerDelegate {
    func configure() {
        view.addSubviews(imageView, titleLabel, subtitleLabel, backBtn, pageControl, nextBtn)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: AppConstants.Spacing.medium.rawValue),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.Spacing.small.rawValue),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -AppConstants.Spacing.small.rawValue),
            imageView.heightAnchor.constraint(equalToConstant: CGFloat.deviceHeight / 3),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: AppConstants.Spacing.medium.rawValue),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: AppConstants.Spacing.medium.rawValue),
            subtitleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppConstants.Spacing.large.rawValue),
            backBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: backBtn.bottomAnchor),
            
            nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -AppConstants.Spacing.large.rawValue),
            nextBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            nextBtn.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor)
        ])
        
        backBtn.addTarget(self, action: #selector(didTapBackBtn), for: .touchUpInside)
        nextBtn.addTarget(self, action: #selector(didTapNextBtn), for: .touchUpInside)
        pageControl.addTarget(self, action: #selector(pageControlValueChanged), for: .valueChanged)
    }
    
    func updateUI(model: OnboardModel, index: Int) {
        DispatchQueue.main.async {
            self.imageView.image = model.image
            self.titleLabel.text = model.title
            self.subtitleLabel.text = model.subtitle
            self.pageControl.currentPage = index
        }
    }

    func navigateScreen() {
        DispatchQueue.main.async {
            let isLoginManager = UserDefaultsManager<Bool>(key: AppConstants.UserDefaultsEnums.isLogin.rawValue)
            let viewController = (isLoginManager.value ?? false) ? TabBarViewController() : LoginViewController()
            viewController.modalPresentationStyle = .fullScreen
            viewController.modalTransitionStyle = .flipHorizontal
            self.present(viewController, animated: true)
        }
        
    }
}

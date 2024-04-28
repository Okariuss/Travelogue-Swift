//
//  OnboardViewController.swift
//  Travelogue-Swift
//
//  Created by Okan Orkun on 23.04.2024.
//

import UIKit

protocol OnboardViewControllerDelegate: BaseViewControllerDelegate {
    func updateUI(model: OnboardModel, index: Int)
}

final class OnboardViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        return addImageView(image: AppConstants.Images.onboard1.toImage)
    }()
    
    private lazy var titleLabel: UILabel = {
            return addLabel(text: L10N.onboardFirstHeader, color: .black, font: Theme.defaultTheme().themeFont.largeTitleFont)
        }()
    
    private lazy var subtitleLabel: UILabel = {
        return addLabel(text: L10N.onboardFirstSubtitle, color: .black, font: Theme.defaultTheme().themeFont.bodyFont)
    }()
    
    private lazy var backBtn: UIButton = {
        return addButton(hasImage: true, image: AppConstants.SystemImages.back.normal, tintColor: .text, method: #selector(didTapBackBtn))
    }()
    
    private lazy var pageControl: UIPageControl = {
        return addPageControl(pages: 3, currentIndicatorColor: .text, method: #selector(pageControlValueChanged))
    }()
    
    private lazy var nextBtn: UIButton = {
        return addButton(hasImage: true, image: AppConstants.SystemImages.next.normal, tintColor: .text, method: #selector(didTapNextBtn))
    }()
    
    private lazy var viewModel: OnboardViewModel<OnboardViewController> = OnboardViewModel()
    
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
    }
    
    func updateUI(model: OnboardModel, index: Int) {
        DispatchQueue.main.async {
            self.imageView.image = model.image
            self.titleLabel.text = model.title
            self.subtitleLabel.text = model.subtitle
            self.pageControl.currentPage = index
        }
    }

    func navigateScreen(_ vc: UIViewController) {
        DispatchQueue.main.async {
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            self.present(vc, animated: true)
        }
    }
}

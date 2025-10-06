//
//  HomeViewController.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 02/10/25.
//

import UIKit
import SwiftUI

class HomeViewController: BaseViewController {
    
    internal var viewModel: HomeViewModel!
    private let backgroundImageView = UIImageView()
    private let countryName = UILabel()
    private let weatherIcon = UIImageView(image: UIImage(named: "bulutliOyKunduzi"))
    private let gradusLabel = UILabel()
    
    private let blurContainer = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
    private let segmentControl = UISegmentedControl(items: ["Weekly", "Monthly"])
    
    private let dayStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setUpWeatherIcon()
        setupBlurContainer()
        setupDays()
        self.viewModel = HomeViewModel(self)
    }
    
    private func setupBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        backgroundImageView.contentMode = .scaleAspectFill
        updateBackgroundForMode()
    }
    
    private func updateBackgroundForMode() {
        if traitCollection.userInterfaceStyle == .dark {
            backgroundImageView.image = UIImage(named: "backImageDark")
        } else {
            backgroundImageView.image = UIImage(named: "backImage")
        }
    }
    
    private func setUpWeatherIcon() {
        
        view.addSubview(countryName)
        countryName.text = "Uzbekistan"
        countryName.textAlignment = .center
        countryName.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        countryName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countryName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            countryName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countryName.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(weatherIcon)
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherIcon.topAnchor.constraint(equalTo: countryName.bottomAnchor),
            weatherIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherIcon.widthAnchor.constraint(equalToConstant: 100),
            weatherIcon.heightAnchor.constraint(equalToConstant: 100)
        ])
        weatherIcon.contentMode = .scaleAspectFit
        
        view.addSubview(gradusLabel)
        gradusLabel.text = "20°"
        gradusLabel.textAlignment = .center
        gradusLabel.font = UIFont.systemFont(ofSize: 80, weight: .semibold)
        gradusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gradusLabel.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor),
            gradusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gradusLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    private func setupBlurContainer() {
        view.addSubview(blurContainer)
        blurContainer.layer.cornerRadius = 30
        blurContainer.clipsToBounds = true
        blurContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blurContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blurContainer.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2 - 50)
        ])
        
        blurContainer.contentView.addSubview(segmentControl)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalTo: blurContainer.contentView.topAnchor, constant: 15),
            segmentControl.centerXAnchor.constraint(equalTo: blurContainer.contentView.centerXAnchor),
            segmentControl.widthAnchor.constraint(equalToConstant: windowWidth - 20)
        ])
    }
    
    private func setupDays() {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        blurContainer.contentView.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 25),
            scrollView.leadingAnchor.constraint(equalTo: blurContainer.contentView.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: blurContainer.contentView.trailingAnchor, constant: -10),
//            scrollView.bottomAnchor.constraint(equalTo: blurContainer.contentView.bottomAnchor, constant: -15),
            scrollView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        let dayStack = UIStackView()
        dayStack.axis = .horizontal
        dayStack.alignment = .top
        dayStack.distribution = .equalSpacing
        dayStack.spacing = 12
        dayStack.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(dayStack)
        
        NSLayoutConstraint.activate([
            dayStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            dayStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            dayStack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            dayStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            dayStack.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
        
        let days = [
            ("Sun", "Sunny"),
            ("Mon", "Cloudy"),
            ("Tue", "Rainy"),
            ("Wed", "Windy"),
            ("Thu", "Sunny"),
            ("Fri", "Stormy"),
            ("Sat", "Cloudy")
        ]
        
        for (index, item) in days.enumerated() {
            let (day, weatherType) = item
            let capsule = UIView()
            capsule.layer.cornerRadius = 20
            capsule.clipsToBounds = true
            
            // Gradient qo‘shamiz
            let gradient = CAGradientLayer()
            gradient.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
            gradient.cornerRadius = 20
            switch weatherType {
            case "Sunny":
                gradient.colors = [UIColor.systemYellow.cgColor, UIColor.systemOrange.cgColor]
            case "Cloudy":
                gradient.colors = [UIColor.systemGray4.cgColor, UIColor.systemBlue.withAlphaComponent(0.4).cgColor]
            case "Rainy":
                gradient.colors = [UIColor.systemTeal.cgColor, UIColor.systemBlue.cgColor]
            case "Windy":
                gradient.colors = [UIColor.systemMint.cgColor, UIColor.systemTeal.cgColor]
            case "Stormy":
                gradient.colors = [UIColor.systemIndigo.cgColor, UIColor.systemGray.cgColor]
            default:
                gradient.colors = [UIColor.systemFill.cgColor, UIColor.secondarySystemFill.cgColor]
            }
            capsule.layer.insertSublayer(gradient, at: 0)
            
            // Ichki vertikal stack
            let vStack = UIStackView()
            vStack.axis = .vertical
            vStack.alignment = .center
            vStack.distribution = .equalSpacing
            vStack.spacing = 4
            
            let dayLabel = UILabel()
            dayLabel.text = day
            dayLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            dayLabel.textColor = .white
            
            let tempTitle = UILabel()
            tempTitle.text = "Temp:"
            tempTitle.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            tempTitle.textColor = .white.withAlphaComponent(0.8)
            
            let tempValue = UILabel()
            tempValue.text = "\(18 + index)°"
            tempValue.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            tempValue.textColor = .white
            
            let windTitle = UILabel()
            windTitle.text = "Wind:"
            windTitle.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            windTitle.textColor = .white.withAlphaComponent(0.8)
            
            let windValue = UILabel()
            windValue.text = "\(5 + index) km/h"
            windValue.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            windValue.textColor = .white
            
            let moreButton = UIButton(type: .system)
            moreButton.setTitle("More", for: .normal)
            moreButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            moreButton.tintColor = .white
            moreButton.addTarget(self, action: #selector(moreButtonTapped(_:)), for: .touchUpInside)
            
            [dayLabel, tempTitle, tempValue, windTitle, windValue, moreButton].forEach { vStack.addArrangedSubview($0) }
            
            capsule.addSubview(vStack)
            vStack.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                vStack.centerXAnchor.constraint(equalTo: capsule.centerXAnchor),
                vStack.centerYAnchor.constraint(equalTo: capsule.centerYAnchor)
            ])
            
            dayStack.addArrangedSubview(capsule)
            capsule.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                capsule.widthAnchor.constraint(equalToConstant: 100),
                capsule.heightAnchor.constraint(equalToConstant: 150)
            ])
        }
    }

    @objc private func moreButtonTapped(_ sender: UIButton) {
        print("More tapped!")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateBackgroundForMode()
    }
}

extension HomeViewController: HomeViewProtocol {
    func reloadData() {}
    func reload(section: [Int]) {}
    func reload(indexPath: [IndexPath]) {}
    func showLoader(_ show: Bool) {}
}

//
//#Preview("Home Light", traits: .fixedLayout(width: 390, height: 844)) {
//    UIViewControllerPreview {
//        let vc = HomeViewController()
//        vc.overrideUserInterfaceStyle = .light
//        return vc
//    }
//}
//
//#Preview("Home Dark", traits: .fixedLayout(width: 390, height: 844)) {
//    UIViewControllerPreview {
//        let vc = HomeViewController()
//        vc.overrideUserInterfaceStyle = .dark
//        return vc
//    }
//}
//
//// MARK: - UIKit Preview Wrapper
//
//struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
//    let builder: () -> ViewController
//    
//    init(_ builder: @escaping () -> ViewController) {
//        self.builder = builder
//    }
//    
//    func makeUIViewController(context: Context) -> ViewController {
//        return builder()
//    }
//    
//    func updateUIViewController(_ uiViewController: ViewController, context: Context) {}
//}

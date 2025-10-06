//
//  CityViewController.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 05/10/25.
//

import UIKit
import SwiftUI

class CityViewController: UIViewController {
    
    private let backgroundImageView = UIImageView()
    private let weatherIcon = UIImageView(image: UIImage(named: "weather_day"))
    private let blurContainer = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
    private let cityButton = UIButton(type: .system)
    private let cityStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupWeatherIcon()
        setupBlurContainer()
        setupCityButton()
        setupCityList()
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
            weatherIcon.image = UIImage(named: "weather_night")
        } else {
            backgroundImageView.image = UIImage(named: "backImage")
            weatherIcon.image = UIImage(named: "weather_day")
        }
    }
    
    private func setupWeatherIcon() {
        view.addSubview(weatherIcon)
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            weatherIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherIcon.widthAnchor.constraint(equalToConstant: 100),
            weatherIcon.heightAnchor.constraint(equalToConstant: 100)
        ])
        weatherIcon.contentMode = .scaleAspectFit
    }
    
    private func setupBlurContainer() {
        view.addSubview(blurContainer)
        blurContainer.translatesAutoresizingMaskIntoConstraints = false
        blurContainer.layer.cornerRadius = 30
        blurContainer.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            blurContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blurContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40),
            blurContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            blurContainer.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupCityButton() {
        blurContainer.contentView.addSubview(cityButton)
        cityButton.translatesAutoresizingMaskIntoConstraints = false
        cityButton.setTitle("Select Your City ⌄", for: .normal)
        cityButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        cityButton.tintColor = .label
        cityButton.setTitleColor(.label, for: .normal)
        
        NSLayoutConstraint.activate([
            cityButton.topAnchor.constraint(equalTo: blurContainer.contentView.topAnchor, constant: 20),
            cityButton.centerXAnchor.constraint(equalTo: blurContainer.contentView.centerXAnchor)
        ])
    }
    
    private func setupCityList() {
        blurContainer.contentView.addSubview(cityStack)
        cityStack.axis = .vertical
        cityStack.spacing = 15
        cityStack.alignment = .center
        cityStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cityStack.topAnchor.constraint(equalTo: cityButton.bottomAnchor, constant: 25),
            cityStack.centerXAnchor.constraint(equalTo: blurContainer.contentView.centerXAnchor)
        ])
        
        let cities = ["Pune", "Mumbai", "Jaipur", "Udaipur", "More"]
        for name in cities {
            let label = UILabel()
            label.text = name
            label.textColor = .label
            label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            cityStack.addArrangedSubview(label)
        }
    }
    

    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateBackgroundForMode()
    }
}

#Preview {
    CityViewController()
}

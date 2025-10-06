//
//  MoreViewController.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 05/10/25.
//

import UIKit
import SwiftUI

class MoreViewController: UIViewController {
    
    // MARK: - UI Elements
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "day_background"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let blurEffectView: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let view = UIVisualEffectView(effect: blur)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    private let titleDropdown: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("\"Quote's for day\"  ▼", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        return button
    }()
    
    private func createWeatherCard(icon: String, time: String, detail: String) -> UIView {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        card.layer.cornerRadius = 22
        card.clipsToBounds = true
        card.transform = CGAffineTransform(rotationAngle: -.pi / 24)
        
        let iconView = UIImageView(image: UIImage(systemName: icon))
        iconView.tintColor = .white
        iconView.contentMode = .scaleAspectFit
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        let timeLabel = UILabel()
        timeLabel.text = time
        timeLabel.textColor = .white
        timeLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let detailLabel = UILabel()
        detailLabel.text = detail
        detailLabel.textColor = .lightGray
        detailLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        card.addSubview(iconView)
        card.addSubview(timeLabel)
        card.addSubview(detailLabel)
        
        NSLayoutConstraint.activate([
            iconView.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),
            iconView.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 50),
            iconView.heightAnchor.constraint(equalToConstant: 50),
            
            timeLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            timeLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 14),
            
            detailLabel.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor),
            detailLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 4)
        ])
        
        return card
    }

    private lazy var card1 = createWeatherCard(icon: "cloud.bolt.rain.fill", time: "Morning", detail: "Rain with thunder")
    private lazy var card2 = createWeatherCard(icon: "cloud.sun.fill", time: "Afternoon", detail: "Sunny and bright")
    private lazy var card3 = createWeatherCard(icon: "cloud.moon.fill", time: "Night", detail: "Cool with clouds")
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    private func setupLayout() {
        view.addSubview(backgroundImage)
        view.addSubview(blurEffectView)
        view.addSubview(titleDropdown)
        view.addSubview(card1)
        view.addSubview(card2)
        view.addSubview(card3)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleDropdown.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleDropdown.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleDropdown.widthAnchor.constraint(equalToConstant: 220),
            titleDropdown.heightAnchor.constraint(equalToConstant: 40),
            
            card1.topAnchor.constraint(equalTo: titleDropdown.bottomAnchor, constant: 60),
            card1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            card1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            card1.heightAnchor.constraint(equalToConstant: 80),
            
            card2.topAnchor.constraint(equalTo: card1.bottomAnchor, constant: 40),
            card2.leadingAnchor.constraint(equalTo: card1.leadingAnchor),
            card2.trailingAnchor.constraint(equalTo: card1.trailingAnchor),
            card2.heightAnchor.constraint(equalToConstant: 80),
            
            card3.topAnchor.constraint(equalTo: card2.bottomAnchor, constant: 40),
            card3.leadingAnchor.constraint(equalTo: card1.leadingAnchor),
            card3.trailingAnchor.constraint(equalTo: card1.trailingAnchor),
            card3.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.userInterfaceStyle == .dark {
            backgroundImage.image = UIImage(named: "night_background")
        } else {
            backgroundImage.image = UIImage(named: "day_background")
        }
    }
}

#Preview() {
    MoreViewController()
}

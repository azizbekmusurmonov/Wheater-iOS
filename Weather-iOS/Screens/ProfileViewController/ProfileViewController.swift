//
//  ProfileViewController.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 05/10/25.
//

import UIKit

class ProfileViewController: UIViewController {
        
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "day_background"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person.circle.fill"))
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Azizbek Musurmonov"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Weather Explorer 🌦️"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let darkModeSwitch = UISwitch()
    private let darkModeLabel: UILabel = {
        let label = UILabel()
        label.text = "Dark Mode"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateAppearance()
    }
    
    private func setupUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(infoLabel)
        view.addSubview(cardView)
        view.addSubview(darkModeLabel)
        view.addSubview(darkModeSwitch)
        
        darkModeSwitch.translatesAutoresizingMaskIntoConstraints = false
        darkModeSwitch.addTarget(self, action: #selector(toggleDarkMode), for: .valueChanged)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cardView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 60),
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.widthAnchor.constraint(equalToConstant: 320),
            cardView.heightAnchor.constraint(equalToConstant: 70),
            
            darkModeLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            darkModeLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            
            darkModeSwitch.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            darkModeSwitch.centerYAnchor.constraint(equalTo: cardView.centerYAnchor)
        ])
    }
    
    // MARK: - Dark Mode Handling
    
    @objc private func toggleDarkMode() {
        if darkModeSwitch.isOn {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
        updateAppearance()
    }
    
    private func updateAppearance() {
        if traitCollection.userInterfaceStyle == .dark {
            backgroundImageView.image = UIImage(named: "night_background")
            cardView.backgroundColor = UIColor.white.withAlphaComponent(0.1)
            darkModeLabel.textColor = .white
            infoLabel.textColor = .lightGray
        } else {
            backgroundImageView.image = UIImage(named: "day_background")
            cardView.backgroundColor = UIColor.black.withAlphaComponent(0.15)
            darkModeLabel.textColor = .black
            infoLabel.textColor = .darkGray
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateAppearance()
    }
}

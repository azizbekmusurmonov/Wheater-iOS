//
//  ScreenShotManager.swift
//  iOSShablon
//
//  Created by Muhriddinbek Samidov on 02/07/25.
//

import UIKit

final class ScreenshotShield {
    
    static let shared = ScreenshotShield()

    private var shieldWindow: UIWindow?
    
    private init() {}

    func activateShield() {
        guard shieldWindow == nil else { return }

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.windowLevel = UIWindow.Level.statusBar + 2
        window.isHidden = false

        let shieldViewController = UIViewController()
        shieldViewController.view.backgroundColor = .black

        let warningLabel = UILabel()
        warningLabel.text = "Xavfsizlik siyosatiga ko‘ra ekran tasvirini olish, video yozib olish yoki ekrandan foydalanish uchun ruxsat bermaymiz."
        warningLabel.textColor = .white
        warningLabel.numberOfLines = 0
        warningLabel.textAlignment = .center
        warningLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        warningLabel.translatesAutoresizingMaskIntoConstraints = false

        shieldViewController.view.addSubview(warningLabel)
        NSLayoutConstraint.activate([
            warningLabel.centerXAnchor.constraint(equalTo: shieldViewController.view.centerXAnchor),
            warningLabel.centerYAnchor.constraint(equalTo: shieldViewController.view.centerYAnchor),
            warningLabel.leadingAnchor.constraint(equalTo: shieldViewController.view.leadingAnchor, constant: 24),
            warningLabel.trailingAnchor.constraint(equalTo: shieldViewController.view.trailingAnchor, constant: -24)
        ])
        
        // Magic: UITextField snapshot hack
        let secureTrick = UITextField()
        secureTrick.isSecureTextEntry = true
        secureTrick.isUserInteractionEnabled = false
        secureTrick.backgroundColor = .clear
        secureTrick.frame = .zero
        shieldViewController.view.addSubview(secureTrick)

        window.rootViewController = shieldViewController
        window.makeKeyAndVisible()

        shieldWindow = window
    }

    func deactivateShield() {
        shieldWindow?.isHidden = true
        shieldWindow = nil
    }
}

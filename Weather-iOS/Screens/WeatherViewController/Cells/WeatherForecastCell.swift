//
//  WeatherForecastCell.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 05/10/25.
//

import UIKit

class WeatherForecastCell: UICollectionViewCell {
    static let reuseId = "WeatherForecastCell_code"

    private let imgWeather: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let lblTime: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    private let lblTemperature: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.systemGray6
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.masksToBounds = false

        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        contentView.addSubview(imgWeather)
        contentView.addSubview(lblTime)
        contentView.addSubview(lblTemperature)

        // Layout: image on top, time above, temp below
        NSLayoutConstraint.activate([
            imgWeather.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imgWeather.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imgWeather.widthAnchor.constraint(equalToConstant: 44),
            imgWeather.heightAnchor.constraint(equalToConstant: 44),

            lblTime.topAnchor.constraint(equalTo: imgWeather.bottomAnchor, constant: 8),
            lblTime.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            lblTime.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),

            lblTemperature.topAnchor.constraint(equalTo: lblTime.bottomAnchor, constant: 6),
            lblTemperature.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            lblTemperature.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            lblTemperature.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -6)
        ])
    }

    // Configure with data
    func configure(timeText: String, iconName: String?, tempText: String) {
        lblTime.text = timeText
        lblTemperature.text = tempText

        if let icon = iconName, let image = UIImage(named: icon) {
            imgWeather.image = image
            imgWeather.tintColor = nil
        } else if let icon = iconName {
            // fallback to SF Symbol if asset not found
            imgWeather.image = UIImage(systemName: icon)
            imgWeather.tintColor = .systemYellow
        } else {
            imgWeather.image = UIImage(named: "02d")
        }
    }
}


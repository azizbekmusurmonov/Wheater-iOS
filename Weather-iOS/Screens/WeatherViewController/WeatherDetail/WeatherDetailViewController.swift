//
//  WeatherDetailViewController.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 05/10/25.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    // MARK: - UI elementlar
    private let weatherStatusImageView = UIImageView()
    private let lblDate = UILabel()
    
    private let lblTempTitle = UILabel()
    private let lblTemp = UILabel()
    
    private let lblMaxTempTitle = UILabel()
    private let lblMaxTemp = UILabel()
    
    private let lblMinTempTitle = UILabel()
    private let lblMinTemp = UILabel()
    
    private let lblHumidityTitle = UILabel()
    private let lblHumidity = UILabel()
    
    private let lblDescriptionTitle = UILabel()
    private let lblDescription = UILabel()
    
    // MARK: - Model
    var weekForecast: WeekWeatherInfo?
    var currentWeatherData: WeatherData?
    var tempBool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Weather Detail"
        setupUI()
        setupLayout()
        updateWeatherData()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = UIColor(red: 0.95, green: 1.0, blue: 0.97, alpha: 1.0)
        
        // Weather Image
        weatherStatusImageView.contentMode = .scaleAspectFit
        weatherStatusImageView.image = UIImage(named: "01d")
        
        // Date Label
        lblDate.text = "Monday, Oct 06, 2025"
        lblDate.font = .boldSystemFont(ofSize: 18)
        lblDate.textColor = UIColor(red: 0.2, green: 0.0, blue: 0.8, alpha: 1)
        lblDate.textAlignment = .center
        
        // Title labels
        configureTitle(lblTempTitle, "Temperature :")
        configureTitle(lblMaxTempTitle, "Max temperature :")
        configureTitle(lblMinTempTitle, "Min temperature :")
        configureTitle(lblHumidityTitle, "Humidity :")
        configureTitle(lblDescriptionTitle, "Description :")
        
        // Value labels
        configureValue(lblTemp)
        configureValue(lblMaxTemp)
        configureValue(lblMinTemp)
        configureValue(lblHumidity)
        configureValue(lblDescription)
        
        // Add all subviews
        [
            weatherStatusImageView, lblDate,
            lblTempTitle, lblTemp,
            lblMaxTempTitle, lblMaxTemp,
            lblMinTempTitle, lblMinTemp,
            lblHumidityTitle, lblHumidity,
            lblDescriptionTitle, lblDescription
        ].forEach { view.addSubview($0) }
    }
    
    private func configureTitle(_ label: UILabel, _ text: String) {
        label.text = text
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = UIColor.systemBlue
    }
    
    private func configureValue(_ label: UILabel) {
        label.font = .systemFont(ofSize: 17)
        label.textColor = .black
    }
    
    // MARK: - Layout
    private func setupLayout() {
        let padding: CGFloat = 40
        
        [
            weatherStatusImageView, lblDate,
            lblTempTitle, lblTemp,
            lblMaxTempTitle, lblMaxTemp,
            lblMinTempTitle, lblMinTemp,
            lblHumidityTitle, lblHumidity,
            lblDescriptionTitle, lblDescription
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            weatherStatusImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            weatherStatusImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherStatusImageView.heightAnchor.constraint(equalToConstant: 150),
            weatherStatusImageView.widthAnchor.constraint(equalToConstant: 150),
            
            lblDate.topAnchor.constraint(equalTo: weatherStatusImageView.bottomAnchor, constant: 20),
            lblDate.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Dynamic labels vertical stacking
        var previous = lblDate.bottomAnchor
        let pairs = [
            (lblTempTitle, lblTemp),
            (lblMaxTempTitle, lblMaxTemp),
            (lblMinTempTitle, lblMinTemp),
            (lblHumidityTitle, lblHumidity),
            (lblDescriptionTitle, lblDescription)
        ]
        
        for (title, value) in pairs {
            NSLayoutConstraint.activate([
                title.topAnchor.constraint(equalTo: previous, constant: 25),
                title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                value.centerYAnchor.constraint(equalTo: title.centerYAnchor),
                value.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
            previous = title.bottomAnchor
        }
    }
    
    // MARK: - Update weather data
    private func updateWeatherData() {
        if let tempInKelvin = weekForecast?.main.temp {
            let tempInCelsius = Utility.kelvinToCelsius(kelvin: tempInKelvin)
            let celsiusTemperature = Int(tempInCelsius)
            let fahrenheitTemperature = Int(celsiusToFahrenheit(Double(celsiusTemperature)))
            lblTemp.text = tempBool ? "\(celsiusTemperature) °C" : "\(fahrenheitTemperature) °F"
            lblHumidity.text = String(weekForecast?.main.humidity ?? 0)
        }
        
        if let tempInKelvin = weekForecast?.main.temp_min {
            let tempInCelsius = Utility.kelvinToCelsius(kelvin: tempInKelvin)
            let celsiusTemperature = Int(tempInCelsius)
            let fahrenheitTemperature = Int(celsiusToFahrenheit(Double(celsiusTemperature)))
            lblMinTemp.text = tempBool ? "\(celsiusTemperature) °C" : "\(fahrenheitTemperature) °F"
        }
        
        if let tempInKelvin = weekForecast?.main.temp_max {
            let tempInCelsius = Utility.kelvinToCelsius(kelvin: tempInKelvin)
            let celsiusTemperature = Int(tempInCelsius)
            let fahrenheitTemperature = Int(celsiusToFahrenheit(Double(celsiusTemperature)))
            lblMaxTemp.text = tempBool ? "\(celsiusTemperature) °C" : "\(fahrenheitTemperature) °F"
        }
        
        if let description = self.currentWeatherData?.weather.first?.description {
            self.lblDescription.text = description
        } else {
            self.lblDescription.text = "NA"
        }
        
        if let iconName = weekForecast?.weather.first?.icon,
           let icon = UIImage(named: iconName) {
            self.weatherStatusImageView.image = icon
        } else {
            self.weatherStatusImageView.image = UIImage(named: "01d")
        }
        
        if let date = weekForecast?.dt {
            self.lblDate.text = Utility.getDateFromTimeStamp(timeStamp: date)
        } else {
            self.lblDate.text = "NA"
        }
    }
    
    private func celsiusToFahrenheit(_ celsius: Double) -> Double {
        return (celsius * 9/5) + 32
    }
}

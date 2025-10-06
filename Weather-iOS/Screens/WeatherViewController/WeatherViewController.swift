//
//  WeatherViewController.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 05/10/25.
//

import UIKit

// MARK: - WeatherViewController (code-only)
class WeatherViewController: UIViewController {

    // MARK: UI elements (match storyboard layout)
    private let searchButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        btn.tintColor = .black
        btn.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        return btn
    }()

    private let locationImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "location"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    private let lblCity: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        lbl.textColor = .black
        lbl.text = "Tashkent"
        return lbl
    }()

    private let calendarImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "date"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    private let lblDate: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        lbl.textColor = .darkGray
        lbl.text = "Date"
        return lbl
    }()

    // Big center weather image
    private let imgWeatherStatusPic: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "02d") ?? UIImage(systemName: "cloud.sun.fill"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    private let termoImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "temprature"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    private let temperatureLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        lbl.textColor = .black
        lbl.text = "17 °C"
        return lbl
    }()

    private let lblWeatherDescription: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        lbl.textColor = .darkGray
        lbl.textColor = .darkGray
        lbl.textColor = .darkGray
        lbl.text = "Description"
        return lbl
    }()

    private let btnTempSegment: UISegmentedControl = {
        let seg = UISegmentedControl(items: ["°C", "°F"])
        seg.translatesAutoresizingMaskIntoConstraints = false
        seg.selectedSegmentIndex = 0
        seg.selectedSegmentTintColor = UIColor.systemBlue
        return seg
    }()

    private let btnForecastSegment: UISegmentedControl = {
        let seg = UISegmentedControl(items: ["Today", "Weekly"])
        seg.translatesAutoresizingMaskIntoConstraints = false
        seg.selectedSegmentIndex = 0
        seg.selectedSegmentTintColor = UIColor.systemBlue
        return seg
    }()

    private lazy var weatherCollectionViewList: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.register(WeatherForecastCell.self, forCellWithReuseIdentifier: WeatherForecastCell.reuseId)
        cv.showsHorizontalScrollIndicator = false
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()

    // MARK: ViewModel & data
    var viewModel = WeatherViewModel()

    var weekForecast: [WeekWeatherInfo] = []
    var todayForeCast: [WeekWeatherInfo] = []
    var currentWeatherData: WeatherData?
    let cityManager = LocationManager.shared

    var tempBool = true

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor { trait in
            return trait.userInterfaceStyle == .dark ? .black : UIColor(red: 0.95, green: 1.0, blue: 0.97, alpha: 1.0)
        }

        setupHierarchy()
        setupConstraints()
        setupActions()
        initViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }


    // MARK: Setup UI
    private func setupHierarchy() {
        view.addSubview(searchButton)
        view.addSubview(locationImageView)
        view.addSubview(lblCity)
        view.addSubview(calendarImageView)
        view.addSubview(lblDate)
        view.addSubview(imgWeatherStatusPic)
        view.addSubview(termoImageView)
        view.addSubview(temperatureLabel)
        view.addSubview(lblWeatherDescription)
        view.addSubview(btnTempSegment)
        view.addSubview(btnForecastSegment)
        view.addSubview(weatherCollectionViewList)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // search button top-right
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            searchButton.widthAnchor.constraint(equalToConstant: 44),
            searchButton.heightAnchor.constraint(equalToConstant: 44),

            // location image & city label (left, aligned with search button center)
            locationImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            locationImageView.centerYAnchor.constraint(equalTo: searchButton.centerYAnchor),
            locationImageView.widthAnchor.constraint(equalToConstant: 28),
            locationImageView.heightAnchor.constraint(equalToConstant: 28),

            lblCity.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 10),
            lblCity.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),

            // calendar & date (below city)
            calendarImageView.topAnchor.constraint(equalTo: lblCity.bottomAnchor, constant: 12),
            calendarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calendarImageView.widthAnchor.constraint(equalToConstant: 20),
            calendarImageView.heightAnchor.constraint(equalToConstant: 20),

            lblDate.leadingAnchor.constraint(equalTo: calendarImageView.trailingAnchor, constant: 8),
            lblDate.centerYAnchor.constraint(equalTo: calendarImageView.centerYAnchor),

            // Big weather image in center
            imgWeatherStatusPic.topAnchor.constraint(equalTo: calendarImageView.bottomAnchor, constant: 32),
            imgWeatherStatusPic.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imgWeatherStatusPic.widthAnchor.constraint(equalToConstant: 160),
            imgWeatherStatusPic.heightAnchor.constraint(equalToConstant: 160),

            // Thermometer image at left of temperature
            termoImageView.topAnchor.constraint(equalTo: imgWeatherStatusPic.bottomAnchor, constant: 16),
            termoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            termoImageView.widthAnchor.constraint(equalToConstant: 36),
            termoImageView.heightAnchor.constraint(equalToConstant: 36),

            // Temperature label aligned with termoImage
            temperatureLabel.centerYAnchor.constraint(equalTo: termoImageView.centerYAnchor),
            temperatureLabel.leadingAnchor.constraint(equalTo: termoImageView.trailingAnchor, constant: 24),

            // Description centered below temperature
            lblWeatherDescription.topAnchor.constraint(equalTo: termoImageView.bottomAnchor, constant: 12),
            lblWeatherDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            // Temp unit segment
            btnTempSegment.bottomAnchor.constraint(equalTo: btnForecastSegment.topAnchor, constant: -30),
            btnTempSegment.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnTempSegment.widthAnchor.constraint(equalToConstant: 140),

            // Forecast segment (Today / Weekly)
            btnForecastSegment.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -170),
            btnForecastSegment.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnForecastSegment.widthAnchor.constraint(equalToConstant: windowWidth - 40),

            // CollectionView at bottom area
            weatherCollectionViewList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            weatherCollectionViewList.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            weatherCollectionViewList.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            weatherCollectionViewList.heightAnchor.constraint(equalToConstant: 130)
        ])
    }

    private func setupActions() {
        btnTempSegment.addTarget(self, action: #selector(onTempSegmentChanged(_:)), for: .valueChanged)
        btnForecastSegment.addTarget(self, action: #selector(onForecastSegmentChanged(_:)), for: .valueChanged)
        searchButton.addTarget(self, action: #selector(onSearchTapped), for: .touchUpInside)
    }

    // MARK: ViewModel Integration
    func initViewModel() {
        // Callback to update the weather forecast list
        viewModel.reloadWeatherList = { [weak self] arrData in
            DispatchQueue.main.async {
                self?.updateForeCastList(arrForeCastData: arrData)
            }
        }

        // Callback to show the current weather data
        viewModel.showWeatherData = { [weak self] cityData in
            if let cityData = cityData {
                self?.currentWeatherData = cityData
            }
            DispatchQueue.main.async {
                self?.showCityWeatherData()
            }
        }

        // Fetches the current city using the location manager
        cityManager.getCurrentCity { [weak self] result in
            switch result {
            case .success(let cityName):
                self?.viewModel.getWeatherForeCastData(city: cityName)
                self?.viewModel.getCityWeatherData(city: cityName)
            case .failure(let error):
                print("Error getting city name: \(error)")
            }
        }
    }

    func updateForeCastList(arrForeCastData: [WeekWeatherInfo]) {
        self.weekForecast = arrForeCastData.filter({ Utility.isTimeIntervalForToday(timeInterval: $0.dt ?? .zero) == false })
        self.todayForeCast = arrForeCastData.filter({ Utility.isTimeIntervalForToday(timeInterval: $0.dt ?? .zero) == true  })
        self.weatherCollectionViewList.reloadData()
    }

    func showCityWeatherData() {
        if let timeInterval = self.currentWeatherData?.dt {
            self.lblDate.text = Utility.getDateFromTimeStamp(timeStamp: timeInterval)
        } else {
            self.lblDate.text = "NA"
        }

        if let description = self.currentWeatherData?.weather.first?.description {
            self.lblWeatherDescription.text = description
        } else {
            self.lblWeatherDescription.text = "NA"
        }

        if let city = self.currentWeatherData?.name {
            self.lblCity.text = city
        } else {
            self.lblCity.text = "NA"
        }

        if let temperature = self.currentWeatherData?.main.temp {
            let celsiusTemperature = Utility.kelvinToCelsius(kelvin: temperature)
            let fahrenheitTemperature = celsiusToFahrenheit(celsiusTemperature)
            self.temperatureLabel.text = tempBool ? String(format: "%.0f °C", celsiusTemperature) : String(format: "%.0f °F", fahrenheitTemperature)
        } else {
            self.temperatureLabel.text = "NA"
        }

        if let iconName = self.currentWeatherData?.weather.first?.icon, let icon = UIImage(named: iconName) {
            self.imgWeatherStatusPic.image = icon
        } else {
            // fallback big weather image from assets
            self.imgWeatherStatusPic.image = UIImage(named: "02d")
        }
    }

    // MARK: Actions
    @objc private func onTempSegmentChanged(_ sender: UISegmentedControl) {
        tempBool = (sender.selectedSegmentIndex == 0)
        // update temperature label and collection view cell texts
        showCityWeatherData()
        weatherCollectionViewList.reloadData()
    }

    @objc private func onForecastSegmentChanged(_ sender: UISegmentedControl) {
        weatherCollectionViewList.reloadData()
    }

    @objc private func onSearchTapped() {
        let alert = UIAlertController(title: "Search", message: "Enter a city name", preferredStyle: .alert)
        alert.addTextField { tf in tf.placeholder = "Tashkent" }
        alert.addAction(UIAlertAction(title: "Search", style: .default, handler: { [weak self] _ in
            guard let city = alert.textFields?.first?.text, !city.isEmpty else { return }
            self?.viewModel.getWeatherForeCastData(city: city)
            self?.viewModel.getCityWeatherData(city: city)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }

    // MARK: Temperature helpers
    func celsiusToFahrenheit(_ celsius: Double) -> Double {
        return round((celsius * 9/5) + 32)
    }

    func convertTemperature(_ celsius: Double) -> String {
        let rounded = round(celsius)
        return tempBool ? String(format: "%.0f °C", rounded) : String(format: "%.0f °F", celsiusToFahrenheit(rounded))
    }
}

// MARK: - Collection DataSource & Delegate
extension WeatherViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (btnForecastSegment.selectedSegmentIndex == 0) ? todayForeCast.count : weekForecast.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherForecastCell.reuseId, for: indexPath) as? WeatherForecastCell else {
            return UICollectionViewCell()
        }

        let currentListArray = (btnForecastSegment.selectedSegmentIndex == 0) ? todayForeCast : weekForecast
        let data = currentListArray[indexPath.item]

        // Time or Date text
        var timeText = "NA"
        if let timeInterval = data.dt {
            if btnForecastSegment.selectedSegmentIndex == 0 {
                timeText = Utility.getDateFromTimeStamp(timeStamp: timeInterval, timeFormat: .timeOnly)
            } else {
                timeText = Utility.getDateFromTimeStamp(timeStamp: timeInterval)
            }
        }

        // Icon (asset name from API) or fallback
        let iconName = data.weather.first?.icon // matches user's API usage

        // Temperature conversion
        var tempText = "NA"
        if let tKelvin = data.main.temp {
            let tC = Utility.kelvinToCelsius(kelvin: tKelvin)
            tempText = convertTemperature(tC)
        }

        cell.configure(timeText: timeText, iconName: iconName, tempText: tempText)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected index:", indexPath.item)

        let currentListArray = (btnForecastSegment.selectedSegmentIndex == 0) ? todayForeCast : weekForecast
        let data = currentListArray[indexPath.item]

        // Code-based WeatherDetailViewController ni yaratish
        let detailVC = WeatherDetailViewController()
        detailVC.weekForecast = data
        detailVC.currentWeatherData = currentWeatherData
        detailVC.tempBool = tempBool
        
        // NavigationController ga push qilish
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

    // Cell sizing: show 5 per screen width like original
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.bounds.height
        let width = max((collectionView.bounds.width - 16*2 - 20*4) / 5, 70)
        return CGSize(width: width, height: height - 8)
    }
}



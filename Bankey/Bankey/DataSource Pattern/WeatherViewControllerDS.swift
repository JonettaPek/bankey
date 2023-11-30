//
//  WeatherViewControllerDS.swift
//  Bankey
//
//  Created by Jonetta Pek on 30/11/23.
//

import UIKit

extension WeatherViewControllerDS: WeatherServiceDelegate {
    
    func didFetchWeather(_ weather: Weather) { // 5
        cityLabel.text = weather.city
        temperatureLabel.text = weather.temperature
        
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: weather.imageName, withConfiguration: configuration)
        imageView.image = image
    }
}

extension WeatherViewControllerDS: WeatherServiceDataSource {
    
    var city: String? {
        let _city: String? = "San Francisco"
        return _city
    }
}

class WeatherViewControllerDS: UIViewController {
    
    let weatherService = WeatherServiceDS() // 1
    
    let hStack = UIStackView()
    let cityLabel = UILabel()
    let temperatureLabel = UILabel()
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherService.delegate = self // 2
        weatherService.dataSource = self
    }
    
    @objc func weatherPressed() {
        weatherService.fetchWeather() // 3
    }
}

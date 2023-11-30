//
//  WeatherViewController.swift
//  Bankey
//
//  Created by Jonetta Pek on 30/11/23.
//

import UIKit

extension WeatherViewController: WeatherServiceDelegate {
    
    func didFetchWeather(_ weather: Weather) { // 5
        cityLabel.text = weather.city
        temperatureLabel.text = weather.temperature
        
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: weather.imageName, withConfiguration: configuration)
        imageView.image = image
    }
}

class WeatherViewController: UIViewController {
    
    let weatherService = WeatherService() // 1
    
    let hStack = UIStackView()
    let cityLabel = UILabel()
    let temperatureLabel = UILabel()
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherService.delegate = self // 2
    }
    
    @objc func weatherPressed() {
        weatherService.fetchWeather() // 3
    }
}

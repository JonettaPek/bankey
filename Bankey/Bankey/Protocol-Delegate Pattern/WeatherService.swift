//
//  WeatherService.swift
//  Bankey
//
//  Created by Jonetta Pek on 30/11/23.
//

import Foundation

protocol WeatherServiceDelegate: AnyObject {
    
    func didFetchWeather(_ weather: Weather)
}

class WeatherService {
    
    weak var delegate: WeatherServiceDelegate?
    
    func fetchWeather() {
        let weather = Weather(city: "San Francisco", temperature: "21 °C", imageName: "sunset.filled")
        delegate?.didFetchWeather(weather) // 4
    }
}

class Weather {
    var city: String
    var temperature: String
    var imageName: String
    
    init(city: String, temperature: String, imageName: String) {
        self.city = city
        self.temperature = temperature
        self.imageName = imageName
    }
}

//
//  WeatherServiceDS.swift
//  Bankey
//
//  Created by Jonetta Pek on 30/11/23.
//

import Foundation

protocol WeatherServiceDataSource: AnyObject {
    var city: String? { get }
}

class WeatherServiceDS {
    
    weak var delegate: WeatherServiceDelegate?
    weak var dataSource: WeatherServiceDataSource?
    
    func fetchWeather() {
        guard let dataSource = dataSource, let city = dataSource.city else {
            assertionFailure("datasource not set")
            return
        }
        let weather = Weather(city: city, temperature: "21 °C", imageName: "sunset.filled")
        delegate?.didFetchWeather(weather) // 4
    }
}

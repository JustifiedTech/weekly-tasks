//
//  Weather.swift
//  WeatherAppMVVM
//
//  Created by Decagon on 11/20/21.
//

import Foundation

// MARK: - currentWeatherRespnse
struct CurrentWeather: Codable {
    let weather: [Weather]?
    let main: Main?
}

// MARK: - ForecastWeatherResponse
struct ForecastWeather: Codable {
    let list: [List]?
}


// MARK: - List
struct List: Codable {
    let main: Main?
    let weather: [Weather]?
    let dtTxt: String?
    enum CodingKeys: String, CodingKey {
        case main
        case weather
        case dtTxt = "dt_txt"
    }
}

//MARK: - Main
struct Main: Codable {
    let temp, tempMin, tempMax: Double?
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        
    }
}


// MARK: - Weather
struct Weather: Codable {
    let main:String?
}

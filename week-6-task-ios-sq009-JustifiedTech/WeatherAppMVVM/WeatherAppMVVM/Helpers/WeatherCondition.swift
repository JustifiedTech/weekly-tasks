//
//  WeatherCondition.swift
//  WeatherAppMVVM
//
//  Created by Decagon on 11/22/21.
//


import Foundation

enum WeatherCondition: String {
    
    case rainy = "Rain"
    case sunny = "Clear"
    case cloudy = "Clouds"
    
    var title: String {
        switch self {
        case .rainy:
            return "RAINY"
        case .sunny:
            return "SUNNY"
        case .cloudy:
            return "CLOUDY"
        }
    }
    
    var image: String {
        switch self {
        case .rainy:
            return "forest_rainy"
        case .sunny:
            return "forest_sunny"
        case .cloudy:
            return "forest_cloudy"
        }
    }
    
    var weatherIcon: String {
        switch self {
        case .rainy:
            return "rain"
        case .sunny:
            return "clear"
        case .cloudy:
            return "cloud"
        }
    }
    
    var colour: String {
        switch self {
        case .rainy:
            return "rainy"
        case .sunny:
            return "sunny"
        case .cloudy:
            return "cloudy"
        }
    }
}




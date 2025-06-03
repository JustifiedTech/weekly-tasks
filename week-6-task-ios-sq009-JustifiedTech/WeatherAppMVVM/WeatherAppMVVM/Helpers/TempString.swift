//
//  TempString.swift
//  WeatherAppMVVM
//
//  Created by Decagon on 11/22/21.
//

import Foundation

extension Double {
    var asTemperature: String {
        return "\(String(format: "%.1f", self))°"
    }
}





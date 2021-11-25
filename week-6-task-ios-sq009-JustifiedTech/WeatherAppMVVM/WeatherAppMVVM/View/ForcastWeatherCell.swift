//
//  ForcastWeatherCell.swift
//  WeatherAppMVVM
//
//  Created by Decagon on 11/20/21.
//

import UIKit

class ForcastWeatherCell: UITableViewCell {
    
    
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    func configureTableCell(with forcastData: List) {
        tempLabel.text = forcastData.main?.temp?.asTemperature
        dayLabel.text = WeatherViewModel().dateFormatter(forcastData.dtTxt)
        if let data = forcastData.weather?.first?.main,
           let weatherType = WeatherCondition(rawValue: data) {
            weatherImage.image = UIImage(imageLiteralResourceName: weatherType.weatherIcon)
        }
    }
    
    
    
}

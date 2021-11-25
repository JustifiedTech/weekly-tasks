//
//  WeatherViewModel.swift
//  WeatherAppMVVM
//
//  Created by Decagon on 11/22/21.
//

import Foundation

class WeatherViewModel {
    private var networkService = NetworkService()
    
    var forecastWeatherResponse: ForecastWeather?
    var currentWeatherResponse: CurrentWeather?
    var updateUIData: (() -> Void)?
    var delegate: UpdateTableProtocol?
    
    

    func loadDataOnStart(){
        currentWeatherResponse = nil
        forecastWeatherResponse = nil
        
        networkService.getCurrentData(completion: { [weak self](response) in
            switch response {
            case .success(let data):
                self?.currentWeatherResponse = data
            case .failure(let error):
                print ("error processing json data \(error)")
            }
        })
        
        networkService.getForecastData(completion: { [weak self](response) in
            switch response {
            case .success(let data):
                self?.forecastWeatherResponse = data
                DispatchQueue.main.async {
                    self?.updateUIData?()
                }
            case .failure(let error):
                print ("error processing json data \(error)")
            }
        })
        
    }
    
    func dateFormatter(_ date: String?) -> String? {
        guard let inputDate = date else { return nil }
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = formatter.date(from: inputDate) else { return nil }
        let weekDay = Calendar.current.component(.weekday, from: date)
        let currentDayName = Calendar.current.weekdaySymbols[weekDay - 1]
        return currentDayName
    }
    
    var numberOfDays: Int {
        guard let count = forecastWeatherResponse?.list?.count else { return 0 }
        return count/8
    }
    
    func numberOfRowsInSection(section: Int) -> Int{
        return numberOfDays
    }

    func cellForRowAt(indexPath:IndexPath) -> List? {
        
        guard let rowIndex = forecastWeatherResponse?.list?[indexPath.row * 8 + 7] else {
            return nil
        }
        return rowIndex
    }
    
}


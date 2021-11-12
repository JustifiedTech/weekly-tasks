////
////  WeatherData.swift
////  WeatherApp
////
////  Created by Decagon on 11/5/21.
////
//
//import Foundation
//
//class WeatherData {
//     let currentWeatherUrl = "https://api.openweathermap.org/data/2.5/weather?q=Enugu,ng&APPID=72a2b9e90e9941308c58b38f656a8db9"
//
//    let fiveDaysForecastUrl = "https://api.openweathermap.org/data/2.5/forecast?q=Enugu,ng&APPID=72a2b9e90e9941308c58b38f656a8db9"
//
//    func fetchData(_ url:String){
//
//        guard let url = URL(string: url) else { return }
//
//        let dataTask  = URLSession.shared.dataTask(with: url) {
//            data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do {
//                let weatherData = try JSONDecoder().decode(SingleResponse?.self, from: data)
//            }
//            catch{
//                print(error)
//            }
//
//        }
//
//        dataTask.resume()
//
//    }
//
//
//
//    func requestWeatherForLocation() {
//
//
//        let url = "https://api.openweathermap.org/data/2.5/weather?q=Enugu,ng&APPID=72a2b9e90e9941308c58b38f656a8db9"
//
//        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
//
//            // Validation
//            guard let data = data, error == nil else {
//                print("something went wrong")
//                return
//            }
//
//            // Convert data to models/some object
//
//            var json: SingleResponse?
//            do {
//                json = try JSONDecoder().decode(SingleResponse.self, from: data)
//            }
//            catch {
//                print("error: \(error)")
//            }
//
//            guard let result = json else {
//                return
//            }
//print (result)
//
//            // Update user interface
//            DispatchQueue.main.async {
//
//            }
//
//        }).resume()
//    }
//}

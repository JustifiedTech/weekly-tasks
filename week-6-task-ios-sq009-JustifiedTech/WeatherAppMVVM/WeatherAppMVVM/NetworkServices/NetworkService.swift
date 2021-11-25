//
//  NetworkService.swift
//  WeatherAppMVVM
//
//  Created by Decagon on 11/21/21.
//

import Foundation


final class NetworkService {
    
    private var dataTask: URLSessionDataTask?
    let location = "Enugu,ng"
    let apiKey = "72a2b9e90e9941308c58b38f656a8db9"
    let unit = "metric"
    
    
    func getCurrentData(completion: @escaping (Result<CurrentWeather, Error>) -> Void ) {
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(location)&units=\(unit)&APPID=\(apiKey)"
        guard let forecastURL = URL(string: url) else { return }
        fetchWeatherData(from: forecastURL, completion: completion)
        
    }
    
    
    func getForecastData(completion: @escaping (Result<ForecastWeather, Error>) -> Void ) {
        
        let url = "https://api.openweathermap.org/data/2.5/forecast?q=\(location)&units=\(unit)&APPID=\(apiKey)"
        guard let forecastURL = URL(string: url) else { return }
        fetchWeatherData(from: forecastURL, completion: completion)
        
    }
    
    private func fetchWeatherData<T>(from url: URL, completion: @escaping (Result<T, Error>) ->  Void) where T: Codable {
        
        dataTask = URLSession.shared.dataTask(with: url)  { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("empyty respnse")
                return
            }
            print("Response status code: \(response.statusCode)")
            guard let data = data else {
                print("empty data")
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            }
            catch let error {
                completion(.failure(error))
            }
        }
        
        dataTask?.resume()
    }
    
}

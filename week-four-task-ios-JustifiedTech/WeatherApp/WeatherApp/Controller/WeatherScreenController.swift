//
//  WeatherScreenController.swift
//  WeatherApp
//
//  Created by Decagon on 11/5/21.
//

import UIKit

class WeatherScreenController: UIViewController {
    
    let currentWeatherUrl = "https://api.openweathermap.org/data/2.5/weather?q=Enugu,ng&APPID=72a2b9e90e9941308c58b38f656a8db9"
   
   let ForecastUrl = "https://api.openweathermap.org/data/2.5/forecast?q=Enugu,ng&APPID=72a2b9e90e9941308c58b38f656a8db9"
    

    @IBOutlet weak var weatherTableView: UITableView!
    @IBOutlet weak var currentView: UIView!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTopLabel: UILabel!
    @IBOutlet weak var currentWeatherStateLabel: UILabel!
    @IBOutlet weak var currentWeatherMin: UILabel!
    @IBOutlet weak var currentWeatherMax: UILabel!
    @IBOutlet weak var currentWeatherBottomlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        currentWeatherRes(url: currentWeatherUrl){
                [weak self] (data) in
                self?.currentWeatherResponse = data
            
//            print("current",data)
            }
            forecastWeatherRes(url: ForecastUrl){
                [weak self] (eachforecast) in
                self?.forecastWeatherResponse = eachforecast
                
//                print("forecast", fore)
                DispatchQueue.main.async {
                    self?.dispatch()
                }
            }
        weatherTableView.dataSource = self
    }
    
    var forecastWeatherResponse: ForecastWeatherResponse?
    var currentWeatherResponse:CurrentWeatherResponse?
    
   
    private func dispatch(){
          if let currentWeatherResponse = currentWeatherResponse {
              currentWeatherTopLabel.text = "\(Int(((currentWeatherResponse.main?.temp) ?? 0) - 273))°"
  //            currenWeatherTop.text = "\((Clouds)"
              let currentWeather = currentWeatherResponse.weather?[0].main ?? ""
              if currentWeather  == "Rain" {
                  currentWeatherStateLabel.text = "RAINY"
                  currentWeatherImage.image = UIImage(imageLiteralResourceName: "sea_rainy")
                  weatherTableView.backgroundColor = UIColor(red: 87/225, green: 87/225, blue: 93/225, alpha: 1)
                  currentView.backgroundColor = weatherTableView.backgroundColor

          }else if currentWeather  == "Clear" {
                  currentWeatherStateLabel.text = "SUNNY"
                currentWeatherImage.image = UIImage(imageLiteralResourceName: "sea_sunny")
                  weatherTableView.backgroundColor = UIColor(red: 74/225, green: 144/225, blue: 226/225, alpha: 1)
              currentView.backgroundColor = weatherTableView.backgroundColor
              }
              
              else  {
                  currentWeatherStateLabel.text = "CLOUDY"
                  currentWeatherImage.image = UIImage(imageLiteralResourceName: "sea_cloudy")
                  weatherTableView.backgroundColor = UIColor(red: 84/225, green: 113/225, blue: 122/225, alpha: 1)
                  currentView.backgroundColor = weatherTableView.backgroundColor
              }
              
            currentWeatherMin.text = "\(Int(((currentWeatherResponse.main?.tempMin) ?? 0) - 273))°"
                          currentWeatherBottomlabel.text = "\(Int(((currentWeatherResponse.main?.temp) ?? 0) - 273))°"
                          currentWeatherMax.text = "\(Int(((currentWeatherResponse.main?.tempMax) ?? 0) - 273))°"
                      
              
          weatherTableView.reloadData()
      }
    
    }
    
    func currentWeatherRes(url requestUrl: String, completionHandler: @escaping (CurrentWeatherResponse) -> Void) {
          guard let url = URL(string: requestUrl) else { return }
          let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
              if let _ = error { return }
              guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else { return }
              guard let data = data else { return }
              let responseData = try? JSONDecoder().decode(CurrentWeatherResponse.self, from: data)
              if let res = responseData {
                  completionHandler(res)
              }
          })
          task.resume()
      }
    
    
     func forecastWeatherRes(url requestUrl: String, completionHandler: @escaping (ForecastWeatherResponse) -> Void) {
        guard let url = URL(string: requestUrl) else { return }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let _ = error { return }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else { return }
            guard let data = data else { return }
            let responseData = try? JSONDecoder().decode(ForecastWeatherResponse.self, from: data)
            if let res = responseData {
                completionHandler(res)
            }
        })
        task.resume()
    }
    
    
}


extension WeatherScreenController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = forecastWeatherResponse?.list?.count else { return 5}
            return count/8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let forecastCell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell", for: indexPath)
        
        guard let weatherCell = forecastCell as? WeatherCellTableViewCell else {
            return UITableViewCell (
            
            )
        }
        
        guard let weatherForcast = forecastWeatherResponse else { return UITableViewCell() }
        let eachCellData = weatherForcast.list?[indexPath.row * 8 + 7]
        
        weatherCell.tempLabel.text = "\(Int(eachCellData?.main?.temp ?? 0) - 273)°"
        weatherCell.weatherImage.image = (eachCellData?.weather?[0].main ?? "" ) == "Rain" ? UIImage(imageLiteralResourceName: "rain") : (eachCellData?.weather?[0].main ?? "" ) == "Clear" ?  UIImage(imageLiteralResourceName: "clear"): UIImage(imageLiteralResourceName: "cloud")
        
        weatherCell.dayLabel.text = getDay(eachCellData?.dtTxt ?? "")
        return weatherCell
        
    }
    
    func getDay(_ date: String?) -> String {
            guard let inputDate = date else {
            return ""
        }
            
        let formatter = DateFormatter()
           formatter.locale = Locale.current
            formatter.timeZone = TimeZone.current
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let date = formatter.date(from: inputDate) ?? Date.now
            let weekDay = Calendar.current.component(.weekday, from: date)
            let currentDayName = Calendar.current.weekdaySymbols[weekDay - 1]
            return currentDayName

    }
    

}




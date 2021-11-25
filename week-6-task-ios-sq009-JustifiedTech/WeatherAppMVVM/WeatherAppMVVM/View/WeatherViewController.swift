//
//  WeatherViewController.swift
//  WeatherAppMVVM
//
//  Created by Decagon on 11/22/21.
//

import UIKit



class WeatherViewController: UIViewController {
    
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTempLabel: UILabel!
    
    @IBOutlet weak var currentWeatherLabel: UILabel!
    
    @IBOutlet weak var currentWeatherView: UIView!
    
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentMinTempLabel: UILabel!
    @IBOutlet weak var currentMaxTempLabel: UILabel!
    @IBOutlet weak var weatherTable: UITableView!
    
    private var viewModel = WeatherViewModel()
    
    private var refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableOnLoad()
        viewModel.loadDataOnStart()
        viewModel.updateUIData = updateCurrentWeatherUI
        viewModel.delegate?.updateTable()
        
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        
    }
    private func setupTableOnLoad() {
        weatherTable.dataSource = self
    }
    
    @objc private func refresh(send:UIRefreshControl){
        DispatchQueue.main.async {
            self.viewModel.loadDataOnStart()
            self.viewModel.updateUIData = self.updateCurrentWeatherUI
            self.refreshControl.endRefreshing()
            
        }
    }
    
    private func updateCurrentWeatherUI() {
        if let currentWeatherResponse = viewModel.currentWeatherResponse {
            if let currentWeather = currentWeatherResponse.weather?.first?.main,
               let type = WeatherCondition(rawValue: currentWeather) {
                currentWeatherView.backgroundColor = UIColor(named: type.colour)
                currentWeatherLabel.text = type.title
                weatherTable.backgroundColor = UIColor(named: type.colour)
                currentWeatherImage.image = UIImage(imageLiteralResourceName: type.image)
            }
            currentTempLabel.text = currentWeatherResponse.main?.temp?.asTemperature
            currentWeatherTempLabel.text = currentWeatherResponse.main?.temp?.asTemperature
            currentMinTempLabel.text = currentWeatherResponse.main?.tempMin?.asTemperature
            currentMaxTempLabel.text = currentWeatherResponse.main?.tempMax?.asTemperature
        }
        weatherTable.reloadData()
    }
}
extension WeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let forecastCell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell", for: indexPath)
        guard let weatherCell = forecastCell as? ForcastWeatherCell,
              let weatherForcast = viewModel.cellForRowAt(indexPath: indexPath)
        else {
            return UITableViewCell ()
        }
        
        weatherCell.configureTableCell(with: weatherForcast)
        return weatherCell
    }
}

extension WeatherViewController:UpdateTableProtocol {
    func updateTable() {
        self.weatherTable.reloadData()
    }
}


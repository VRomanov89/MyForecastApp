//
//  WeatherViewController.swift
//  MyForecastApp
//
//  Created by Volodymyr Romanov on 7/31/16.
//  Copyright © 2016 Volodymyr Romanov. All rights reserved.
//

import UIKit
import Alamofire

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var weateherImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var weather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        weather = CurrentWeather()
        //forecast = Forecast()
        
        weather.downloadWeatherDetails {
            self.downloadForecastData() {
               //Setup UI
                self.updateMainUI()
            }
        }
        
    }
    
    func downloadForecastData(completed: DownloadComplete) {
        let forecastURL = URL(string: FORECAST_URL)!
        Alamofire.request(.GET, forecastURL).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                //print(dict)
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        //print(obj)
                    }
                    self.tableView.reloadData()
                }
            }
            completed()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherTableViewCell {
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        } else {
            return WeatherTableViewCell()
        }
    }
    
    func updateMainUI() {
        dateLabel.text = weather.date
        temperatureLabel.text = "\(weather.currentTemperature)"
        locationLabel.text = weather.cityName
        weatherLabel.text = weather.weatherType
        weateherImage.image = UIImage(named: weather.weatherType)
    }
}


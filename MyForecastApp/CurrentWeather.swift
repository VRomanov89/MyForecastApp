//
//  CurrentWeather.swift
//  MyForecastApp
//
//  Created by Volodymyr Romanov on 8/1/16.
//  Copyright © 2016 Volodymyr Romanov. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather {
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemperature: Double!
    
    var cityName:String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemperature: Double {
        if _currentTemperature == nil {
            _currentTemperature = 0.0
        }
        return _currentTemperature
    }
    
    func downloadWeatherDetails(completed: DownloadComplete) {
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(.GET, currentWeatherURL).responseJSON { response in
            let result = response.result
            print(response)
        }
        completed()
    }
}

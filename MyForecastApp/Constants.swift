//
//  Constants.swift
//  MyForecastApp
//
//  Created by Volodymyr Romanov on 8/1/16.
//  Copyright © 2016 Volodymyr Romanov. All rights reserved.
//

import Foundation

let BASE_URL: String = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "99b59d3fbf182030d9d07a17d19f3a1d"
let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)35\(LONGITUDE)139\(APP_ID)\(API_KEY)"

typealias DownloadComplete = () -> ()

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?id=524901&appid=99b59d3fbf182030d9d07a17d19f3a1d"

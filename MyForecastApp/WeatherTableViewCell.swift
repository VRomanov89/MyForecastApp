//
//  WeatherTableViewCell.swift
//  MyForecastApp
//
//  Created by Volodymyr Romanov on 8/3/16.
//  Copyright © 2016 Volodymyr Romanov. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    func configureCell(forecast: Forecast) {
        lowTempLabel.text = "\(forecast.lowTemp)"
        highTempLabel.text = "\(forecast.highTemp)"
        weatherLabel.text = forecast.weatherType
        dayLabel.text = forecast.date
        weatherImage.image = UIImage(named: forecast.weatherType)
    }
}

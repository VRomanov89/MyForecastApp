//
//  WeatherViewController.swift
//  MyForecastApp
//
//  Created by Volodymyr Romanov on 7/31/16.
//  Copyright © 2016 Volodymyr Romanov. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var weateherImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


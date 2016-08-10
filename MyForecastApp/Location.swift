//
//  Location.swift
//  MyForecastApp
//
//  Created by Volodymyr Romanov on 8/9/16.
//  Copyright © 2016 Volodymyr Romanov. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() { }
    var latitude: Double!
    var longitude: Double!
}

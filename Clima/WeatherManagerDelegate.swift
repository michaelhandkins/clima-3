//
//  WeatherManagerDelegate.swift
//  Clima
//
//  Created by Michael Handkins on 9/23/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    
    func didFailWithError(error: Error)
}

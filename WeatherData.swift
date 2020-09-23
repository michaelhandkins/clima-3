//
//  WeatherData.swift
//  Clima
//
//  Created by Michael Handkins on 9/23/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    
    let main: Main
    let weather: [Weather]
    let name: String
    
}

struct Main: Codable {
    let temp: Double
}
    
struct Weather: Codable {
    let id: Int
}

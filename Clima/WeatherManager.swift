//
//  WeatherManager.swift
//  Clima
//
//  Created by Michael Handkins on 9/22/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    func fetchWeather(cityName: String) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(OpenWeatherKey)"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let presentError = error {
                    print(presentError)
                }
                
                if let safeData = data {
                    print(String(data: safeData, encoding: .utf8)!)
                }
            }
            
            task.resume()
            
        }
        
    }
    
}

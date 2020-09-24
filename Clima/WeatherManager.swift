//
//  WeatherManager.swift
//  Clima
//
//  Created by Michael Handkins on 9/22/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(lat: Double, lon: Double) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(OpenWeatherKey)&units=imperial"
        
        self.networkRequest(urlString: urlString)
    }
    
    func fetchWeather(cityName: String) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(OpenWeatherKey)&units=imperial"
        
        self.networkRequest(urlString: urlString)
    }
    
    func networkRequest(urlString: String) {
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let presentError = error {
                    self.delegate?.didFailWithError(error: presentError)
                }
                
                if let safeData = data {
                    if let weatherData = self.parseData(data: safeData) {
                        let temp = String(Int(weatherData.main.temp))
                        let cityName = weatherData.name
                        let id = weatherData.weather[0].id
                        let weatherModel = WeatherModel(temperature: temp, conditionID: id, city: cityName)
                        self.delegate?.didUpdateWeather(self, weather: weatherModel)
                    }
                }
            }
            
            task.resume()
            
        }
        
    }
    
    func parseData(data: Data) -> WeatherData? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(WeatherData.self, from: data)
        } catch {
            print("Error while parsing JSON from network request: \(error)")
        }
        return nil
    }
    
}

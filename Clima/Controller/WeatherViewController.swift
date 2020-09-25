//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        
        if textField.text != "" {
            
            let city = (textField.text!).replacingOccurrences(of: " ", with: "+")
            weatherManager.fetchWeather(cityName: city)
            
        }
    }
}

extension WeatherViewController: CLLocationManagerDelegate {

    @IBAction func navButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            weatherManager.fetchWeather(lat: lat, lon: lon)
        }
        
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

}

extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.conditionImageView.image = UIImage(systemName: weather.conditionSymbol)
            self.cityLabel.text = weather.city
            self.temperatureLabel.text = weather.temperature
        }
        
    }
    
    func didFailWithError(error: Error) {
        print("Error while trying to retrieve data in URLSession: \(error)")
    }
    
    
    
    
}


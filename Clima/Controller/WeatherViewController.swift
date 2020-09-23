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
    
    let weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let locationManager = CLLocationManager()
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.requestLocation()
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        
        if textField.text != "" {
            
            let city = textField.text
            weatherManager.fetchWeather(cityName: city)
            
        }
        
        
    }
    


}

//extension WeatherViewController: CLLocationManagerDelegate {
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//
//    }
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//
//    }
//
//}


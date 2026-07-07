//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
//import ReactiveSwift

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
    let apiKey = "0dc4eb295ef271fbe67c3eeede1c2ed8"
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchField: UITextField!
    
    var weatherManager = WeatherManger()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchField.delegate = self
        weatherManager.delegate = self
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searchField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            textField.placeholder = "Search Place"
            return true
        } else {
            textField.placeholder = "Please, Type Something!"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //fetch weather data
        if let cityName = textField.text {
            weatherManager.fetchWeather(forCity: cityName)
        }
        searchField.text = ""
    }
    
    func updateWeather(weather: WeatherModel) {
        print(weather.temperatureString)
    }
}

//
//  WeatherManger.swift
//  Clima
//
//  Created by Maria Sultana on 7/7/26.
//  Copyright © 2026 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManger {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=0dc4eb295ef271fbe67c3eeede1c2ed8&units=metric"
    
    func fetchWeather(forCity city: String) {
        let url = "\(weatherUrl)&q=\(city)"
        print(url)
    }
}

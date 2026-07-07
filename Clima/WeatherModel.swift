//
//  WeatherModel.swift
//  Clima
//
//  Created by Maria Sultana on 7/7/26.
//  Copyright © 2026 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let id: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        String(format: "%0.1f", temperature)
    }
    
    var weatherIconName: String {
        switch id {
        case 200..<300:
            return "cloud.bolt"
        case 300..<400:
            return "cloud.drizzle"
        case 500..<600:
            return "cloud.rain"
        case 600..<700:
            return "cloud.snow"
        case 700..<800:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801..<900:
            return "cloud.sun"
        default:
            return "colud"
        }
    }
}

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
        performRequest(urlString: url)
    }
    
    func performRequest(urlString: String) {
        //Create URL
        guard let url = URL(string: urlString) else {
            print("Could not create URL")
            return
        }
        //Create a URLSession
        let urlSession = URLSession(configuration: .default)
        
        //Give a task to URLSession
        let task = urlSession.dataTask(with: url) { data, response, error in
            if let error {
                print("Found error: \(error)")
                return
            }
            if let data {
                parseData(data: data)
            }
        }
        
        //start the task
        task.resume()
    }
    
    func parseData(data: Data) {
        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            print(getWeatherIcon(weatherId: weatherData.weather[0].id))
        } catch {
            print("Found error: \(error)")
        }
    }
    
    func getWeatherIcon(weatherId: Int) -> String {
        switch weatherId {
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

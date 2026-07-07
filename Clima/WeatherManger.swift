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
        let task = urlSession.dataTask(with: url, completionHandler: handle(data:response:error:))
        
        //start the task
        task.resume()
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if let error {
            print("Found error \(error)")
            return
        }
        if let data {
            let dataString = String(data: data, encoding: .utf8)
            print(dataString)
        }
    }
}

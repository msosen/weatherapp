//
//  WeatherGetter.swift
//  WeatherApp
//
//  Created by Student on 09/10/2018.
//  Copyright © 2018 Maria Sosenkiewicz. All rights reserved.
//

import Foundation

class WeatherGetter {
    
    private let openWeatherMapBaseURL = "https://www.metaweather.com/api/location/"
    
    func getWeather(city:Int) {
        
        // This is a pretty simple networking task, so the shared session will do.
        let session = URLSession.shared
        
        let query = "\(openWeatherMapBaseURL)\(city)/"
        
        let weatherRequest = URL(string: query)!
        
        let weatherRequestURL = URLRequest(url: weatherRequest)
        
        // The data task retrieves the data.
        let dataTask = session.dataTask(with: weatherRequestURL as URLRequest){
            (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                // Case 1: Error
                // We got some kind of error while trying to get data from the server.
                print("Error:\n\(error)")
            }
            else {
                 print("Data:\n\(data!)")
                    // Case 2: Success
                    // We got a response from the server!
                do {
//                    // Try to convert that data into a Swift dictionary
//                    let weather = try NSJSONSerialization.JSONObjectWithData(
//                        data!,
//                        options: .MutableContainers) as! [String: AnyObject]
//
//                    // If we made it to this point, we've successfully converted the
//                    // JSON-formatted weather data into a Swift dictionary.
//                    // Let's print its contents to the debug console.
//                    print("Date and time: \(weather["dt"]!)")
//                    print("City: \(weather["name"]!)")
//
//                    print("Longitude: \(weather["coord"]!["lon"]!!)")
//                    print("Latitude: \(weather["coord"]!["lat"]!!)")
//
//                    print("Weather ID: \(weather["weather"]![0]!["id"]!!)")
//                    print("Weather main: \(weather["weather"]![0]!["main"]!!)")
//                    print("Weather description: \(weather["weather"]![0]!["description"]!!)")
//                    print("Weather icon ID: \(weather["weather"]![0]!["icon"]!!)")
//
//                    print("Temperature: \(weather["main"]!["temp"]!!)")
//                    print("Humidity: \(weather["main"]!["humidity"]!!)")
//                    print("Pressure: \(weather["main"]!["pressure"]!!)")
//
//                    print("Cloud cover: \(weather["clouds"]!["all"]!!)")
//
//                    print("Wind direction: \(weather["wind"]!["deg"]!!) degrees")
//                    print("Wind speed: \(weather["wind"]!["speed"]!!)")
//
//                    print("Country: \(weather["sys"]!["country"]!!)")
//                    print("Sunrise: \(weather["sys"]!["sunrise"]!!)")
//                    print("Sunset: \(weather["sys"]!["sunset"]!!)")
                }
                catch let jsonError as NSError {
                    // An error occurred while trying to convert the data into a Swift dictionary.
                    print("JSON error description: \(jsonError.description)")
                }
                
                    print("Raw data:\n\(data!)\n")
                    let dataString = String(data: data!, encoding: String.Encoding.utf8)
                    print("Human-readable data:\n\(dataString!)")
            }
        }
        // The data task is set up...launch it!
        dataTask.resume()
    }
}

//
//  WeatherData.swift
//  Clima
//
//  Created by Александр on 22.02.2021.
//

/*
 Example JSON file
 
 {
     "coord": {
         "lon": 37.6156,
         "lat": 55.7522
     },
     "weather": [
         {
             "id": 800,
             "main": "Clear",
             "description": "clear sky",
             "icon": "01n"
         }
     ],
     "base": "stations",
     "main": {
         "temp": -15,
         "feels_like": -22.05,
         "temp_min": -17,
         "temp_max": -14,
         "pressure": 1031,
         "humidity": 71
     },
     "visibility": 10000,
     "wind": {
         "speed": 5,
         "deg": 70
     },
     "clouds": {
         "all": 0
     },
     "dt": 1614011438,
     "sys": {
         "type": 1,
         "id": 9027,
         "country": "RU",
         "sunrise": 1613968682,
         "sunset": 1614005302
     },
     "timezone": 10800,
     "id": 524901,
     "name": "Moscow",
     "cod": 200
 }
 
 */

import Foundation

// Variabe names mast mutch to the names in the JSON file
struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
    let description: String
}

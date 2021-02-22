//
//  WeatherManager.swift
//  Clima
//
//  Created by Александр on 22.02.2021.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?"
    var city = ""
    let appid = "" // Here should be Token
    var units = "metric"
    
    var delegate: WeatherManagerDelegate?
    
    // MARK: fetching weather
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)q=\(cityName)&appid=\(appid)&units=\(units)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)lat=\(latitude)&lon=\(longitude)&appid=\(appid)"
        performRequest(with: urlString)
    }
    
    // MARK: Networking
    func performRequest(with urlString: String) {
        
        // Getting rid of any spaces which ruin the whole thing
        let encodedURLString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        // 1. Create a URL
        if let url = URL(string: encodedURLString) {
            
            // 2. Create a URLSession
            let session = URLSession(configuration: .default) // The thing is like a web browser
            
            // 3. Give the session a task
            // Complition handler is executed in background so it requares synchronizing
            let task = session.dataTask(with: url) { (data, response, error) in
                
                // Complition handler for URLSesstion task
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData) // WeatherData.self turns it into just objects type
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}

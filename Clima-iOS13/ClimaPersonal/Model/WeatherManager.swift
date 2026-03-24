//
//  WeatherManager.swift
//  ClimaPersonal
//
//  Created by Michael Peralta on 12/10/22.
//

import Foundation
import CoreLocation
//Declaring the protocol for weather Manager
protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager { // energencyCallHander
    let weatherURL =
    "https://api.openweathermap.org/data/2.5/weather?appid=43bd67ec3858dfc356002f7a1742e4ed&units=metric"
   
    
    var delegate: WeatherManagerDelegate?
    //#2 this struct get city name from the VC class and complete the API URL to fetch the weather data
    func fetchWeather (cityName: String){
           let urlString = "\(weatherURL)&q=\(cityName)"
        //Calling this function will perfom the data request trought the API sending the API URL completed
           performRequest(with: urlString)
       }
    
    func fetchWeather (latitude: CLLocationDegrees, longitute: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitute)"
        performRequest(with: urlString)
    }
   
    //#3 Perfoming the 4 steps requests
    func performRequest(with urlString: String){
        //1. Create a URL
        if let url = URL(string: urlString){
            //2. Crate a URLSession
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    // if da data comes safely this will parse the data from json to a swift object and asigned to the wather property
                    if let weather =  self.parseJson(safeData){
                        //sending the weather data to the Did update weather method to update de data on the screenS
                        self.delegate?.didUpdateWeather(self, weather: weather)
                        
                    }
                }
            }
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJson(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
           let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
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

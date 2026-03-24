//
//  WeatherModel.swift
//  ClimaPersonal
//
//  Created by Michael Peralta on 12/12/22.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
//  //  computed property
//    var aProperty Int{
//        return a+b
//    }

    var temperatureString: String {
        return String(format: "%.0f",temperature)
    }
    
    var conditionName: String {
        switch conditionId {
                case 200...232:
                    return "cloud.bolt"
                case 300...321:
                    return "cloud.drizzle"
                case 500...521:
                    return "cloud.rain"
                case 600...622:
                    return "snow.flake"
                case 701...781:
                    return "cloud.snow"
                case 800:
                    return "cloud.fog"
                case 800...804:
                    return "cloud.bolt"
                default:
                    return "cloud"
                }
    }
    
   
    
}

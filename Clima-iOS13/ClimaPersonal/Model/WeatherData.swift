//
//  weatherData.swift
//  ClimaPersonal
//
//  Created by Michael Peralta on 12/11/22.
//

import Foundation

struct WeatherData: Decodable{
    let name: String
    let main: Main
    let weather: [Weather]
    let visibility: Int
    let sys: Sys
    
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
    let description: String
}

//struct Visibility: Decodable{
//    let visibility : Int
//}

struct Sys: Codable {
    let country: String
}

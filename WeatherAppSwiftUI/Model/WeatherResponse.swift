//
//  WeatherResponse.swift
//  WeatherAppSwiftUI
//
//  Created by can on 22.04.2025.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    
    struct Main: Decodable {
        let temp: Double
    }

    struct Weather: Decodable {
        let description: String
        let icon: String
    }
}
